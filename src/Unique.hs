module Unique (
        unique
    ) where

import Utilities
import IsDeBruijn

differentSequence :: String -> String -> Int -> Bool
differentSequence _ _ 0 = True
differentSequence seq1 seq2 i = if seq1 == seq2
        then False
        else differentSequence (rotate seq1) seq2 (i - 1)

unique :: Int -> String -> IO ()
unique order alphabet = do
    line1 <- getLine
    line2 <- getLine
    if (not $ isDeBruijn order alphabet line1)
        || (not $ isDeBruijn order alphabet line2)
        || not (differentSequence line1 line2 (length line1 + 1))
        then putStrLn "KO"
        else putStrLn "OK"
