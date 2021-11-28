{-# LANGUAGE OverloadedStrings #-}

import Common
import Data.List.Extra (dropPrefix)
import Data.Maybe (fromMaybe)
import qualified GHC.IO.Encoding as E
import Hakyll
import LanguageChooser (languageChooserField)
import System.FilePath ((</>))

languages :: [String]
languages =
	[
	"cs",
	"en"
	]

main :: IO ()
main = do
	E.setLocaleEncoding E.utf8

	hakyll $ do
		match contentPagesPattern $ version menuVersion $ compile destination

		-- Match news posts.
		match postPattern $ do
			route $ stripContentDirectory `composeRoutes` setExtension "html"
			compile $ do
				pandocCompiler
					>>= saveSnapshot "content"
					>>= loadAndApplyTemplate "templates/post.html" defaultContext
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

postPattern :: Pattern
postPattern = "content/*/news/*.md"

languagePattern :: String -> Pattern
languagePattern lang = fromGlob ("content" </> lang </> "**")

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
