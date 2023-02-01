{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}

module BombusHtml where

import Data.Text.Lazy
import Lucid

renderHtml :: String
renderHtml = unpack $ renderText $ base "bombus cloud" index_html

base :: String -> Html () -> Html ()
base title content = doctypehtml_ $ do
    head_ $ do
        meta_ [charset_ "utf-8"]
        title_ (toHtml title)
        link_ [rel_ "stylesheet", type_ "text/css", href_ "main.css"]
    body_ $ do
        header
        content
        footer

header :: Html ()
header = header_ $ h1_ "bombus.cloud"

footer :: Html ()
footer = footer_ $ p_ "email: sam@bombus.cloud"

index_html :: Html ()
index_html = main_ $ do
    img_ [src_ "bee.jpg", alt_ "a bumblebee!"]
    h3_ "More things shall go here eventually!\n\
        \Maybe check back later?"
    p_ "buzz buzz :3"

