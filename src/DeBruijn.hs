module DeBruijn (
        deBruijn
    ) where

import Data.Maybe

import Check
import Unique

deBruijn :: (Maybe Int, Maybe String, Maybe String) -> IO ()
deBruijn (order, alpha, option) = case option of
    Just "--check" -> check order' alpha'
    Just "--unique" -> unique order' alpha'
    Just "--clean" -> putStrLn "TODO"
    _ -> putStrLn "TODO"
    where
        order' = fromJust order
        alpha' = fromJust alpha
