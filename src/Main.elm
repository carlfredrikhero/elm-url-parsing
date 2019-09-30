module Main exposing (Route(..), route, toRoute)

import Html exposing (Html, div, p, text)
import Product exposing (Product)
import Url
import Url.Parser exposing ((</>), Parser, int, map, oneOf, parse, s, top)


type Route
    = Home
    | Blog Int
    | Product Product
    | NotFound


route : Parser (Route -> a) a
route =
    oneOf
        [ map Home top
        , map Blog (s "blog" </> int)
        , map Product Product.urlParser
        ]


toRoute : String -> Route
toRoute string =
    case Url.fromString string of
        Nothing ->
            NotFound

        Just url ->
            Maybe.withDefault NotFound (parse route url)


main : Html msg
main =
    div []
        [ p []
            [ text (Debug.toString (toRoute "https://example.com/blog/123"))
            ]
        , p []
            [ text (Debug.toString (toRoute "https://example.com/"))
            ]
        , p []
            [ text (Debug.toString (toRoute "https://example.com/zeus-3-ship-dlp-2k-dci-4500-lumens-4768.html"))
            ]
        ]
