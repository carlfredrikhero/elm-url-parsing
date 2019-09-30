Just me trying to figure out Elm Url parsing, nothing to see, move along.

# Ok, so here's what I want to achieve

A url like this:

    https://example.com/zeus-3-ship-dlp-2k-dci-4500-lumens-4768.html
                        \________________________________/ \__/
                                        slug                id

should result in a `Parser (ProductId, Slug)` where `ProductId` and `Slug` are defined like this:

    type ProductId
        = ProductId Int

    {-| "a" would be Product or Category depending on context
    -}
    type Slug a
    = Slug String

    type Product
        = Product

    type Category
        = Category