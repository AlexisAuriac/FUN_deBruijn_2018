module DeBruijn (
        deBruijn
    ) where

import Data.Maybe

import Check

deBruijn :: (Maybe Integer, Maybe String, Maybe String) -> IO ()
deBruijn (order, str, option) = case option of
    Just "--check" -> check (fromJust order) (fromJust str)
    Just "--unique" -> putStrLn "TODO"
    Just "--clean" -> putStrLn "TODO"
    _ -> putStrLn "TODO"
