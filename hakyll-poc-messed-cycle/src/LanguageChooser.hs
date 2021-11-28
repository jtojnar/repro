module LanguageChooser (
	languageChooserField
) where

import Common
import Control.Monad (forM)
import Hakyll

data LocalizedLink = LocalizedLink {
	localizedLinkUrl :: String,
	localizedLinkLocale :: String,
	localizedLinkActive :: Bool
}

languageSymbols :: [(String, String)]
languageSymbols =
	[
	("cs", "🇨🇿"),
	("en", "🇬🇧")
	]

languageNames :: [(String, String)]
languageNames =
	[
	("cs", "Čeština"),
	("en", "English")
	]

-- | A field providing a list of links to pages with the same slug.
--
-- When iterated over, it contains the following fields:
--
-- * 'lang' – language code
-- * 'url' – address of the corresponding page for language
-- * 'active' – 'True' if the item is the current page
-- * 'languageSymbol' – emoji flag for the country “matching” the language
-- * 'languageName' – human-readable name of the language
languageChooserField :: [String] -> Context a
languageChooserField languages =
	listFieldWith "languageChooser"languageChooserFieldInner (\_item -> do
		identifier <- getUnderlying
		let path = toFilePath identifier

		existingLocalizedLinks <- forM languages (\lang -> do
			let active = getContentLocale path == lang
			let newPath = setContentLocale path lang

			newItems <- loadAll (fromList $ map (setVersion $ Just menuVersion) [fromFilePath newPath])
			case map itemBody newItems of
				[url] | url == routeNotSet -> return []
				[] -> return []
				[newRoute] -> return [LocalizedLink newRoute lang active]
				_ -> noResult ("languageChooser: This should not happen: Multiple routes found for " ++ newPath)
			)

		return (map (Item identifier) (concat existingLocalizedLinks))
	)

languageChooserFieldInner :: Context LocalizedLink
languageChooserFieldInner =
	field "lang" (\item -> return . localizedLinkLocale . itemBody $ item)
	<> field "url" (\item -> return . localizedLinkUrl . itemBody $ item)
	<> boolField "active" (\item -> localizedLinkActive . itemBody $ item)
	<> languageSymbolField
	<> languageNameField

languageSymbolField :: Context LocalizedLink
languageSymbolField =
	field "languageSymbol" (\item -> do
		let lang = localizedLinkLocale . itemBody $ item

		maybe (noResult ("languageSymbol: Unknown language " ++ lang)) return (lookup lang languageSymbols)
	)

languageNameField :: Context LocalizedLink
languageNameField =
	field "languageName" (\item -> do
		let lang = localizedLinkLocale . itemBody $ item

		maybe (noResult ("languageName: Unknown language " ++ lang)) return (lookup lang languageNames)
	)
