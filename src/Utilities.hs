module Utilities (
        allDifferent,
        allElemsOf,
        rotate,
        combinations
    ) where

allDifferent :: (Eq a) => [a] -> Bool
allDifferent [] = True
allDifferent (x:xs) = x `notElem` xs && allDifferent xs

allElemsOf :: (Eq a) => [a] -> [a] -> Bool
allElemsOf [] _ = True
allElemsOf (c:xs) src = c `elem` src && (allElemsOf xs src)

rotate :: (Eq a) => [a] -> [a]
rotate (x:xs) = xs ++ [x]

-- unused, finds all the combinations given an order and an alphabet
combinations :: (Eq a) => Word -> [a] -> [[a]]
combinations 0 _ = []
combinations 1 alpha = [[i] | i <- alpha]
combinations order alpha = [i:j | i <- alpha, j <- combinations (order - 1) alpha]
