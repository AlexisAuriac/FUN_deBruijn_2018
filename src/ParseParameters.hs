module ParseParameters (
        parseParameters
    ) where

import Text.Read
import Utilities

getOrder :: String -> Maybe Int
getOrder order = do
    let orderInt = readMaybe order :: Maybe Int
    if orderInt <= Just 0 then Nothing else orderInt

getAlphabet :: String -> Maybe String
getAlphabet alpha = if (allDifferent alpha) && (length alpha > 0)
    then Just alpha
    else Nothing

isOption :: String -> Bool
isOption "--check" = True
isOption "--unique" = True
isOption "--clean" = True
isOption _ = False

parseParameters :: [String] -> Maybe (Maybe Int, Maybe String, Maybe String)
parseParameters args
    | length args == 1 = Just (getOrder (args !! 0), Just "01", Just "")
    | length args == 2 = if isOption (args !! 1)
        then Just (getOrder (args !! 0), Just "01", Just (args !! 1))
        else Just (getOrder (args !! 0), getAlphabet (args !! 1), Just "")
    | length args == 3 = if isOption (args !! 1)
        then Just (getOrder (args !! 0), getAlphabet (args !! 2), Just (args !! 1))
        else if isOption (args !! 2)
            then Just (getOrder (args !! 0), getAlphabet (args !! 1), Just (args !! 2))
            else Just (getOrder (args !! 0), getAlphabet (args !! 1), Nothing)
    | otherwise = Nothing
