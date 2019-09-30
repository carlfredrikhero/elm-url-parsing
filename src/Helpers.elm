module Helpers exposing (splitRoute)


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
