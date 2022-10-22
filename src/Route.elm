module Route exposing (..)

import Browser.Dom exposing (Error(..))
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser)


type Route
    = Home
    | Dashboard
    | Board String
    | NotFound


slugs =
    { home = "home"
    , dashboard = "dashboard"
    , board = "board"
    }


parser : Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Home Parser.top
        , Parser.map Home (Parser.s slugs.home)
        , Parser.map Dashboard (Parser.s slugs.dashboard)
        , Parser.map Board (Parser.s slugs.board </> Parser.string)
        ]


fromUrl : Url -> Route
fromUrl url =
    Maybe.withDefault NotFound <|
        Parser.parse parser url
