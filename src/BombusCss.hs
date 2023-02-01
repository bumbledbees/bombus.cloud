{-# LANGUAGE OverloadedStrings #-}

module BombusCss where

import Prelude hiding (all)
import Data.Text.Lazy hiding (all, center, iterate)
import Clay
import Clay.Render

renderCss :: String
renderCss = unpack $ renderWith renderConfig [] stylesheet

renderConfig :: Config
renderConfig = Config
    { indentation    = "\t"
    , newline        = "\n"
    , sep            = " "
    , lbrace         = "{"
    , rbrace         = "}"
    , finalSemicolon = True
    , warn           = True
    , align          = True
    , banner         = False
    , comments       = True
    }

stylesheet :: Css
stylesheet = do globalRules
                mainRules
                headerRules
                footerRules

globalRules :: Css
globalRules = do
    star ? do
        padding nil nil nil nil 
        margin  nil nil nil nil
    p ? do
        paddingTop      (em 0.35)
        paddingBottom   (em 0.35)
    h3 ? do
        paddingTop      (em 0.5)
        paddingBottom   (em 0.5)

mainRules :: Css
mainRules = do
    main_ ? do
        textAlign       center

headerRules :: Css
headerRules = do
    header |> a ? do
        color           black
        textDecoration  none
        textAlign       center
    header ? do
        height          (vh 10)
        minHeight       (em 4)
        margin          auto auto auto auto
        display         flex
        flexDirection   row
        justifyContent  center
        alignItems      center
    ".header-title" ? do
        fontSize        (em 2)
        fontWeight      bold

footerRules :: Css
footerRules = do 
    footer |> p ?
        fontSize        (pt 8)
    footer ? do
        position        fixed
        bottom          nil
        left            nil
        right           nil
        margin          nil auto (vh 2) auto
        textAlign       center
