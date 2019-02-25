module Lib (
        parseParameters,
        deBrujin
    ) where

import MyDie

import Text.Read

getOrder :: String -> Maybe Integer
getOrder order = readMaybe order :: Maybe Integer

getOption :: String -> Maybe String
getOption alpha = 

parseParameters :: [String] -> Maybe (Maybe Integer, Maybe String, Maybe String)
parseParameters args
    | length args == 1 = Just (getOrder (args !! 0), Just "01", Just "")
    | length args == 2 = parse2Parameters args
    | otherwise = Nothing

deBrujin :: Maybe (Maybe Integer, Maybe String, Maybe String) -> IO ()
deBrujin args = putStrLn "hello"
