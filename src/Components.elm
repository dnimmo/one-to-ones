module Components exposing (..)

import Element exposing (..)
import Element.Border as Border
import Font
import Layout


header : String -> Element msg
header str =
    el
        [ Font.title
        , Font.size 48
        , width fill
        , padding 10
        , Border.shadow
            { offset = ( 1, 1 )
            , blur = 10
            , size = 2
            , color = rgba255 0 0 0 0.2
            }
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
