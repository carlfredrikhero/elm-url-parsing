module Product exposing (Product, urlParser)

import ProductId exposing (ProductId)
import Slug exposing (Slug)
import Url.Parser exposing (Parser)


type alias Product =
    ( ProductId, Slug Slug.Product )


urlParser : Parser (ProductId -> a) a -> Parser (Slug b -> c) c -> Parser (Product -> d) d
urlParser =
    Url.Parser.map Tuple.pair
