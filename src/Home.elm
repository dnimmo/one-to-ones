module Home exposing (view)

import Element exposing (..)


view : Element msg
view =
    column []
        [ text "Log in shit will go here"
        , link []
            { url = "/dashboard"
            , label = text "just go to the dashboard for now"
            }
        ]
