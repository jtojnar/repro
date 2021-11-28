{-# LANGUAGE OverloadedStrings #-}

module Common (
	contentPagesPattern,
	menuVersion,
	routeNotSet,
	stripContentDirectory,
	getContentLocale,
	setContentLocale
) where

import Hakyll
import System.FilePath (joinPath, splitDirectories)

-- Patterns

contentPagesPattern :: Pattern
contentPagesPattern = fromRegex "^content/(.+/)?[^@/][^/]+\\.md$"

routeNotSet :: String
routeNotSet = ":route-not-set:"

-- Versions

menuVersion :: String
menuVersion = "menu"

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
