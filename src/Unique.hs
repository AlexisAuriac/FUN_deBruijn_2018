module Unique (
        unique
    ) where

import IsDeBruijn
import DifferentSequences

unique :: Int -> String -> IO ()
unique order alphabet = do
    line1 <- getLine
    line2 <- getLine
    if isDeBruijn order alphabet line1
        && isDeBruijn order alphabet line2
        && differentSequences order alphabet line1 line2
        then putStrLn "OK"
        else putStrLn "KO"
