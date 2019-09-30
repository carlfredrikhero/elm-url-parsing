module Product exposing (Product, urlParser)

import Url.Parser exposing (Parser)


type alias Product =
    ( ProductId, Slug )


type Slug
    = Slug String


type ProductId
    = ProductId Int


urlParser : Parser (Product -> a) a
urlParser =
    Url.Parser.custom "PRODUCT"
        (\str ->
            case splitRoute str of
                ( Just id, slug ) ->
                    Just ( ProductId id, Slug slug )

                _ ->
                    Nothing
        )


splitRoute : String -> ( Maybe Int, String )
splitRoute str =
    case String.right 5 str of
        ".html" ->
            splitRouteHelper (String.dropRight 5 str)

        _ ->
            ( Nothing, str )


splitRouteHelper : String -> ( Maybe Int, String )
splitRouteHelper str =
    let
        parts =
            str |> String.split "-" |> List.reverse
    in
    case List.head parts of
        Nothing ->
            ( Nothing
            , parts |> List.reverse |> String.join "-"
            )

        Just head ->
            ( String.toInt head
            , parts |> List.reverse |> String.join "-"
            )
