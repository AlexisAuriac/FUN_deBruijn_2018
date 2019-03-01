module Utilities (
        allDifferent,
        allElemsOf,
        rotate
    ) where

allDifferent :: (Eq a) => [a] -> Bool
allDifferent [] = True
allDifferent (x:xs) = x `notElem` xs && allDifferent xs

allElemsOf :: (Eq a) => [a] -> [a] -> Bool
allElemsOf [] _ = True
allElemsOf (c:xs) src = c `elem` src && (allElemsOf xs src)

rotate :: (Eq a) => [a] -> [a]
rotate (x:xs) = xs ++ [x]
