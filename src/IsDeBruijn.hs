module IsDeBruijn (
        isDeBruijn
    ) where

import Utilities

getWords :: Int -> String -> Int -> [String]
getWords _ _ 0 = []
getWords order line nbWords = take order line:getWords order (drop 1 line) (nbWords - 1)

isDeBruijn :: Int -> String -> String -> Bool
isDeBruijn order alphabet line
    | length line /= length alphabet ^ order = False
    | not $ allElemsOf line alphabet = False
    | not $ allDifferent $ getWords order (cycle line) (length line) = False
    | otherwise = True
