module Home exposing (view)

import Element exposing (..)


view : Element msg
view =
    el
        [ width fill
        , height fill
        ]
    <|
        column
            [ centerX
            , centerY
            ]
            [ text "Log in shit will go here"
            , link []
                { url = "/dashboard"
                , label = text "just go to the dashboard for now"
                }
            ]
