module Route exposing (..)

import Browser.Dom exposing (Error(..))
import Url exposing (Url)
import Url.Parser as Parser exposing (Parser)


type Route
    = Home
    | NotFound


slugs =
    { home = "home"
    }


parser : Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Home Parser.top
        , Parser.map Home (Parser.s slugs.home)
        ]


fromUrl : Url -> Route
fromUrl url =
    Maybe.withDefault NotFound <|
        Parser.parse parser url
