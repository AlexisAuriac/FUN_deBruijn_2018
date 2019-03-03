module Check (
        check
    ) where

import Utilities
import IsDeBruijn

check :: Int -> String -> IO ()
check order alphabet = do
    line <- getLine
    if isDeBruijn order alphabet line
        then putStrLn "OK"
        else putStrLn "KO"
