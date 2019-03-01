module Check (
        check
    ) where

genWords :: Int -> String -> [String]
genWords order alphabet = increment order alphabet


check :: Int -> String -> IO ()
check order alphabet = getLine >>= \line ->
    print (genWords order alphabet)
