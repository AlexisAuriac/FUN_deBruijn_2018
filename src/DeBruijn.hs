module DeBruijn (
        deBruijn
    ) where

import Data.Maybe

import Check
import Generate

deBruijn :: (Maybe Int, Maybe String, Maybe String) -> IO ()
deBruijn (order, str, option) = case option of
    Just "--check" -> check (fromJust order) (fromJust str)
    Just "--unique" -> putStrLn "TODO"
    Just "--clean" -> putStrLn "TODO"
    _ -> generate (fromJust order) (fromJust str)
