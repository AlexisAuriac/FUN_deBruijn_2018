module Main where

import System.Environment
import System.Exit
import Data.Maybe

import ParseParameters
import DeBruijn

exitUsage :: IO ()
exitUsage = do
    putStrLn "USAGE: ./deBruijn n [a] [--check|--unique|--clean]"
    putStrLn "\t--check\t\tcheck if a sequence is a de Bruijn sequence"
    putStrLn "\t--unique\tcheck if 2 sequences are distinct de Bruijn sequences"
    putStrLn "\t--clean\t\tlist cleaning"
    putStrLn "\tn\t\torder of the sequence"
    putStrLn "\ta\t\talphabet [def: “01”]"
    exitWith (ExitFailure 84)

main :: IO ()
main = do
    args <- getArgs

    let parsed = parseParameters args
    case parsed of
        Nothing -> exitUsage
        Just (Nothing, _, _) -> exitUsage
        Just (_, Nothing, _) -> exitUsage
        Just (_, _, Nothing) -> exitUsage
        _ -> deBruijn (fromJust parsed)
