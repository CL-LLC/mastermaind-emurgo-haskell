import Control.Monad.Trans.State
import Control.Monad.IO.Class
import Data.List (elemIndices)
import System.Console.Haskeline
import System.IO (hGetBuffering, hSetBuffering, stdin, BufferMode(..))
import System.Random (Random(..), randomRIO)

data Color = Red | Green | Blue | Yellow | Magenta | Cyan deriving (Show, Eq, Enum, Bounded)
type Code = [Color]
data Result = Result { exactMatches :: Int, colorMatches :: Int } deriving (Show, Eq)

instance Random Color where
  randomR (a, b) g =
    case randomR (fromEnum a, fromEnum b) g of
      (x, g') -> (toEnum x, g')
  random g = randomR (minBound, maxBound) g

generateCode :: Int -> IO Code
generateCode len = mapM (\_ -> randomRIO (minBound, maxBound)) [1..len]

readUserCode :: IO (Maybe Code)
readUserCode = do
  input <- runInputT defaultSettings (getInputLine "")
  case input of
    Nothing -> readUserCode
    Just line -> return (traverse readColor (words line))

readColor :: String -> Maybe Color
readColor s = case s of
  "red"     -> Just Red
  "green"   -> Just Green
  "blue"    -> Just Blue
  "yellow"  -> Just Yellow
  "magenta" -> Just Magenta
  "cyan"    -> Just Cyan
  _         -> Nothing

evaluateGuess :: Code -> Code -> Result
evaluateGuess secret guess = Result exactMatches colorMatches
  where
    exactMatches = length $ filter id $ zipWith (==) secret guess
    colorMatches = (sum $ map (\c -> min (count c secret) (count c guess)) [minBound..maxBound]) - exactMatches
    count x = length . elemIndices x

type GameState = StateT (Int, Code) IO

playGame :: GameState ()
playGame = do
  (remainingAttempts, secret) <- get
  liftIO $ putStrLn $ "You have " ++ show remainingAttempts ++ " attempts remaining. Enter your guesses: \n"
  maybeGuess <- liftIO readUserCode
  case maybeGuess of
    Nothing -> do
      liftIO $ putStrLn "Invalid color input. Please use one of the following: Red, Green, Blue, Yellow, Magenta, Cyan"
      playGame
    Just guess -> do
      let result = evaluateGuess secret guess
      liftIO $ putStrLn $ "Result: " ++ show result
      if exactMatches result == length secret
        then liftIO $ putStrLn "You won!"
        else if remainingAttempts <= 1
          then do
            liftIO $ putStrLn "You lost!"
            liftIO $ putStrLn $ "The secret code was: " ++ show secret
          else do
            put (remainingAttempts - 1, secret)
            playGame

_LOGO_PATH_ :: FilePath
_LOGO_PATH_ = "./assets/banner.txt"

main :: IO ()
main = do
  putStrLn "\n"
  readFile _LOGO_PATH_ >>= \a -> putStrLn a
  putStrLn "Welcome to Mastermind!\n"
  putStrLn "Mastermind: A code-breaking game where one player creates a secret code using 4 colors (these can be repeated), and the other player attempts to guess the code through a process of deduction. The code-maker provides feedback on each guess, indicating the number of that are the correct color and in the correct position, as well as the number of that are the correct color but in the wrong position.\n"
  putStrLn "Available colors: Red, Green, Blue, Yellow, Magenta, Cyan\n"
  secret <- generateCode 4
  evalStateT playGame (20, secret)