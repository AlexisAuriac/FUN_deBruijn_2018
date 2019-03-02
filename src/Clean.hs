module Clean (
        clean
    ) where

import DifferentSequences

sequenceInList :: Int -> String -> String -> [String] -> Bool
sequenceInList _ _ _ [] = False
sequenceInList order alphabet line (x:xs) =
    if not (differentSequences order alphabet line, x)
        then True
        else sequenceInList order alphabet line xs

clean :: Int -> String -> IO ()
clean order alphabet = do
    readClean []
    where
        readClean :: [String] -> [String]
        readClean kept = do
            line <- getLine
            if line == "END"
                then kept
                else sequenceInList order alphabet line kept
                    then readClean kept
                    else readClean (kept ++ [line])
