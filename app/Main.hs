module Main where

import System.Directory
import System.FilePath
import BombusHtml
import BombusCss

main :: IO ()
main = do
    putStrLn "building..."
    createDirectoryIfMissing False "build"
    resources <- listDirectory "res"
    mapM (\f -> copyFile ("res" </> f) ("build" </> f)) resources
    writeFile "build/index.html" renderHtml
    writeFile "build/main.css" renderCss
