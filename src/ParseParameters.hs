module ParseParameters (
        parseParameters
    ) where

import Text.Read

getOrder :: String -> Maybe Integer
getOrder order = readMaybe order :: Maybe Integer

allDifferent :: [Char] -> Bool
allDifferent []     = True
allDifferent (x:xs) = x `notElem` xs && allDifferent xs

getOption :: String -> Maybe String
getOption alpha = if allDifferent alpha
    then Just alpha
    else Nothing

parseParameters :: [String] -> Maybe (Maybe Integer, Maybe String, Maybe String)
parseParameters args
    | length args == 1 = Just (getOrder (args !! 0), Just "01", Just "")
    | length args == 2 = Just (getOrder (args !! 0), getOption (args !! 1), Just "")
    -- | length args == 2 = parse2Parameters args
    | otherwise = Nothing
