{-# LANGUAGE OverloadedStrings #-}

module BombusCss where

import Data.Text.Lazy
import Clay
import Clay.Render

renderCss :: String
renderCss = unpack(renderWith renderConfig [] stylesheet)

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
stylesheet = do mainRules
                headerRules
                footerRules

mainRules :: Css
mainRules = main_ ? textAlign Clay.center

headerRules :: Css
headerRules = header ? textAlign Clay.center

footerRules :: Css
footerRules = do 
    footer |> p ?
        fontSize    (pt 8)
    footer ? do
        position    fixed
        bottom      nil
        left        nil
        right       nil
        marginLeft  auto
        textAlign   Clay.center
