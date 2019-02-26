module Check (
        check
    ) where

check :: Integer -> String -> IO ()
check order str = getLine >>= \line ->
    putStrLn line
