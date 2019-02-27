module Generate (
        generate
    ) where

import Data.Maybe

-- tryAddSeq :: String -> [String] -> String -> Maybe String
-- tryAddSeq [] _ _ = Nothing
-- tryAddSeq alphabet done lastN =
--     let a = take 1 alphabet in
--     if (lastN ++ a) `elem` done
--         then tryAddSeq (drop 1 alphabet) done lastN
--         else Just a

-- db :: Int -> String -> String -> [String] -> String
-- db order alphabet dBSeq done = do
--     let lenSeq = length dBSeq
--     let lastN = drop (lenSeq - order + 1) dBSeq
--     let newLastChar = tryAddSeq alphabet done lastN

--     case newLastChar of
--         Nothing -> dBSeq
--         _ -> db order alphabet (dBSeq ++ (fromJust newLastChar)) (done ++ [lastN ++ (fromJust newLastChar)])

-- tryAddSeq :: String -> [String] -> String -> Maybe String
-- tryAddSeq [] _ _ = Nothing
-- tryAddSeq alphabet done lastN =
--     let a = take 1 alphabet in
--     if (lastN ++ a) `elem` done
--         then tryAddSeq (drop 1 alphabet) done lastN
--         else Just a

tryAddSeq :: String -> [String] -> String -> Maybe String
tryAddSeq alphabet done lastN =
    if (lastN ++ "1") `elem` done
        then if (lastN ++ "0") `elem` done
            then Nothing
            else Just "0"
        else Just "1"

db :: String -> [String] -> String
-- db :: String -> [String] -> [String]
db dBSeq done = do
    let lenSeq = length dBSeq
    let lastN = drop (lenSeq - 2) dBSeq
    let newLastChar = tryAddSeq "01" done lastN

    case newLastChar of
        Nothing -> dBSeq
        -- Nothing -> done
        _ -> db (dBSeq ++ (fromJust newLastChar)) (done ++ [lastN ++ (fromJust newLastChar)])



generate :: Int -> String -> IO ()
generate order alphabet = do
    -- putStrLn (db order alphabet "000" ["000"])
    -- print (db "000" ["000"])
    putStrLn (db "000" ["000"])