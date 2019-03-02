module Clean (
        clean
    ) where

import IsDeBruijn
import DifferentSequences

sequenceInList :: Int -> String -> String -> [String] -> Bool
sequenceInList _ _ _ [] = False
sequenceInList order alphabet line (x:xs) =
    if not (differentSequences order alphabet line x)
        then True
        else sequenceInList order alphabet line xs

readClean :: Int -> String -> [String] -> IO [String]
readClean order alphabet kept = do
    line <- getLine
    if line == "END"
        then return kept
        else if not (isDeBruijn order alphabet line)
            || sequenceInList order alphabet line kept
            then readClean order alphabet kept
            else readClean order alphabet (kept ++ [line])

printList :: [String] -> IO ()
printList [] = return ()
printList (x:xs) = do
    putStrLn x
    printList xs

clean :: Int -> String -> IO ()
clean order alphabet = do
    cleaned <- readClean order alphabet []
    printList cleaned
