module Main where

import System.Environment
import System.Exit

import Lib
import MyDie

main :: IO ()
main = do
    args <- getArgs

    let parsed = parseParameters args
    case parsed of
        Nothing -> myDie "Invalid number of arguments"
        Just (Nothing, _, _) -> myDie "Invalid order"
        Just (_, Nothing, _) -> myDie "Invalid alphabet"
        Just (_, _, Nothing) -> myDie "Invalid option"
        _ -> deBrujin parsed
