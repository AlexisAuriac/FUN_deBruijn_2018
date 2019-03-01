module IsDeBruijn (
        isDeBruijn
    ) where

import Utilities

getWords :: Int -> String -> [String]
getWords order line = getWords' line
    where
        getWords' :: String -> [String]
        getWords' line'
            | lenLine == 0 = []
            | lenLine < order = 
                (line' ++ take (order - lenLine) line) : getWords' (drop 1 line')
            | otherwise = take order line' : getWords' (drop 1 line')
            where
                lenLine = length line'

isDeBruijn :: Int -> String -> String -> Bool
isDeBruijn order alphabet line
    | length line /= length alphabet ^ order = False
    | not $ allElemsOf line alphabet = False
    | not $ allDifferent $ getWords order line = False
    | otherwise = True
