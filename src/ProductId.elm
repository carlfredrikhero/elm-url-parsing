module ProductId exposing (ProductId, urlParser)

import Url.Parser exposing (Parser)


type ProductId
    = ProductId Int


urlParser : Parser (ProductId -> a) a
urlParser =
    Url.Parser.custom "PRODUCTID"
        (\str -> String.toInt str |> Maybe.map ProductId)
