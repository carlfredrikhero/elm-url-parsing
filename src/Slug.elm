module Slug exposing (Category, Product, Slug, urlParser)

import Url.Parser exposing (Parser)


type Slug a
    = Slug String


type Product
    = Product


type Category
    = Category


urlParser : Parser (Slug a -> b) b
urlParser =
    Url.Parser.custom "SLUG" (\str -> Just (Slug str))
