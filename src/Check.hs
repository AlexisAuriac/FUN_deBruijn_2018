module Check (
        check
    ) where

import Utilities

getWords :: Int -> String -> [String]
getWords order line = getWords' line
    where
        getWords' :: String -> [String]
        getWords' line'
            | length line' == 0 = []
            | length line' < order = (line' ++ take (order - (length line')) line) : getWords' (drop 1 line')
            | otherwise = take order line' : getWords' (drop 1 line')

check :: Int -> String -> IO ()
check order alphabet = getLine >>= check'
    where
        check' line
            | length line /= (length alphabet) ^ order = putStrLn "KO"
            | not (allElemsOf line alphabet) = putStrLn "KO"
            | not (allDifferent (getWords order line)) = putStrLn "KO"
            | otherwise = putStrLn "OK"
