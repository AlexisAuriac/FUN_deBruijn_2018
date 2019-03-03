module Generate (
        generate
    ) where

import Data.Maybe

tryAddSeq :: String -> [String] -> String -> Int -> String
tryAddSeq alphabet done lastN i
    | i == length alphabet = take 1 alphabet
    | otherwise = if (lastN ++ [alphabet !! i]) `elem` done
        then tryAddSeq alphabet done lastN (i + 1)
        else [(alphabet !! i)]

db :: Int -> String -> String -> [String] -> String
db order alpha dBSeq done = do
    let lenSeq = length dBSeq
    let lastN = drop (lenSeq - order + 1) dBSeq
    let newLastChar = tryAddSeq alpha done lastN 0

    if length done == (length alpha) ^ order - order + 1
        then dBSeq
        else db order alpha (dBSeq ++ newLastChar) (done ++ [lastN ++ newLastChar])

generate :: Int -> String -> IO ()
generate order alphabet = do
    let init = replicate order (alphabet !! ((length alphabet) - 1))
    putStrLn (db order alphabet init [init])
