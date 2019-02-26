module Check (
        check
    ) where

check :: Integer -> String -> IO ()
check order alphabet = getLine >>= \line ->
    putStrLn line
