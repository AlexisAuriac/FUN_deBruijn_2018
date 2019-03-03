module DifferentSequences (
        differentSequences
    ) where

import Utilities

differentSequences :: Int -> String -> String -> String -> Bool
differentSequences order alphabet seq1 seq2 = do
    differentSequences' seq1 seq2 (length seq1)
        where
            differentSequences' :: String -> String -> Int -> Bool
            differentSequences' _ _ 0 = True
            differentSequences' seq1' seq2' i = if seq1' == seq2'
                then False
                else differentSequences' (rotate seq1') seq2' (i - 1)
