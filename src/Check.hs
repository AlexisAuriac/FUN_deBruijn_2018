module Check (
        check
    ) where

check :: Int -> String -> IO ()
check order alphabet = getLine >>= \line ->
    putStrLn line
