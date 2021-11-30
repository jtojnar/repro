{-# LANGUAGE OverloadedStrings #-}

import Control.Monad (forM)
import Data.List.Extra (dropPrefix)
import Data.Maybe (fromMaybe)
import Hakyll
import System.FilePath ((</>), joinPath, splitDirectories)

languages :: [String]
languages =
	[
	"cs",
	"en"
	]


-- Patterns

postPattern :: Pattern
postPattern = "content/*/news/*.md"

languagePattern :: String -> Pattern
languagePattern lang = fromGlob ("content" </> lang </> "**")

routeNotSet :: String
routeNotSet = ":route-not-set:"

-- Versions

destinationVersion :: String
destinationVersion = "destination"

-- Routes

stripContentDirectory :: Routes
stripContentDirectory = gsubRoute "content/" (const "")

-- Path manipulation

getContentLocale :: FilePath -> String
getContentLocale path =
	case splitDirectories path of
		"content":locale:_rest -> locale
		_-> error ("Not a content path: " ++ path)

setContentLocale :: FilePath -> String -> FilePath
setContentLocale path newLocale =
	case splitDirectories path of
		"content":_locale:rest -> joinPath ("content":newLocale:rest)
		_-> error ("Not a content path: " ++ path)

main :: IO ()
main = do
	hakyll $ do
		match postPattern $ version destinationVersion $ compile destination

		-- Match news posts.
		match postPattern $ do
			route $ stripContentDirectory `composeRoutes` setExtension "html"
			compile $ do
				pandocCompiler
					>>= saveSnapshot "content"
					>>= loadAndApplyTemplate "templates/layout.html" pageContext

		-- Create news page for each supported language.
		create (map (fromFilePath . (\lang -> "content" </> lang </> "news/index.html")) languages) $ do
			route stripContentDirectory
			compile $ do
				fp <- getResourceFilePath
				let lang = getContentLocale (dropPrefix "./" fp)
				posts <- recentFirst =<< loadAll (postPattern .&&. hasNoVersion .&&. languagePattern lang)

				let indexContext = listField "posts" defaultContext (return posts)
					<> bodyField "body"
					<> metadataField
					<> missingField

				makeItem ""
					>>= loadAndApplyTemplate "templates/posts.html" indexContext
					>>= loadAndApplyTemplate "templates/layout.html" pageContext

		match "templates/*" $ compile templateCompiler

pageContext :: Context String
pageContext =
	languageChooserField languages
	<> defaultContext

-- | Get URL for current Item
destination :: Compiler (Item String)
destination =
	setVersion Nothing <$> getUnderlying
	>>= getRoute
	>>= makeItem . fromMaybe routeNotSet

-- | A field providing a list of links to pages with the same slug as the current page
-- for each of the given languages.
languageChooserField :: [String] -> Context a
languageChooserField langs =
	listFieldWith "languageChooser" languageChooserFieldInner (\_item -> do
		identifier <- getUnderlying
		let path = toFilePath identifier

		existingLocalizedLinks <- forM langs (\lang -> do
			let newPath = setContentLocale path lang

			newItems <- loadAll (fromList $ map (setVersion $ Just destinationVersion) [fromFilePath newPath])
			case map itemBody newItems of
				[url] | url == routeNotSet -> return []
				[] -> return []
				[newRoute] -> return [(newRoute, lang)]
				_ -> noResult ("languageChooser: This should not happen: Multiple routes found for " ++ newPath)
			)

		return (map (Item identifier) (concat existingLocalizedLinks))
	)

languageChooserFieldInner :: Context (String, String)
languageChooserFieldInner =
	field "url" (\item -> return . fst . itemBody $ item)
	<> field "lang" (\item -> return . snd . itemBody $ item)
