module DeBrujin (
        deBrujin
    ) where

import Data.Maybe

import Check

deBrujin :: (Maybe Integer, Maybe String, Maybe String) -> IO ()
deBrujin (order, str, option) = case option of
    Just "--check" -> check (fromJust order) (fromJust str)
    Just "--unique" -> putStrLn "TODO"
    Just "--clean" -> putStrLn "TODO"
    _ -> putStrLn "TODO"
