module MyDie (
        myDie
    ) where

import System.IO (hPutStrLn, stderr)
import System.Exit

myDie :: String -> IO ()
myDie s = do
    hPutStrLn stderr s
    exitWith (ExitFailure 84)
