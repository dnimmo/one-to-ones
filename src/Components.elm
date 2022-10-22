module Components exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Font
import Layout


roundedBorder : Attribute msg
roundedBorder =
    Border.rounded 12


shadow : Attribute msg
shadow =
    Border.shadow
        { offset = ( 1, 1 )
        , blur = 10
        , size = 2
        , color = rgba255 0 0 0 0.2
        }


header : String -> Element msg
header str =
    el
        [ Font.title
        , Font.size 48
        , width fill
        , padding 10
        , shadow
        , Background.color <| rgb255 255 255 255
        ]
    <|
        el [ centerX ] <|
            text str


frame :
    { title : String
    , contents : List (Element msg)
    }
    -> Element msg
frame { title, contents } =
    el
        [ width fill
        , height fill
        , Font.default
        ]
    <|
        column
            [ width fill
            , height fill
            , Layout.verticalSpacing
            , Background.color <| rgba255 0 0 255 0.2
            ]
            [ header title
            , column
                [ width fill
                , height fill
                , Layout.verticalSpacing
                , Layout.standardPadding
                ]
                contents
            ]
