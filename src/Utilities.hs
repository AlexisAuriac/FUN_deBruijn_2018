module Utilities (
        allDifferent
    ) where

allDifferent :: [Char] -> Bool
allDifferent []     = True
allDifferent (x:xs) = x `notElem` xs && allDifferent xs
