module FerramentasIO where
import System.Process(callCommand)
import Control.Concurrent (threadDelay)
import System.IO.Unsafe (unsafePerformIO)
import System.IO
import System.Console.ANSI


limparTela :: IO()
limparTela = callCommand "clear"

delay :: IO ()
delay = threadDelay (1 * 1000000) -- 1.0 segundo

lerCaractere :: IO Char
lerCaractere = do
    hSetBuffering stdin NoBuffering
    hSetEcho stdin False
    char <- getChar
    hSetEcho stdin True
    hSetBuffering stdin LineBuffering
    return char

lerInt :: IO Int
lerInt = do
    hSetBuffering stdin NoBuffering
    hSetEcho stdin False
    int <- getChar
    hSetEcho stdin True
    hSetBuffering stdin LineBuffering
    return (read [int])
    