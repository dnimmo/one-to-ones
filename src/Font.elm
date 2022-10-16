module Font exposing (default, size, title, underline)

import Element exposing (Attribute)
import Element.Font as Font


default : Attribute msg
default =
    Font.family
        [ Font.external
            { name = "Roboto"
            , url = "https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap"
            }
        ]


title : Attribute msg
title =
    Font.family
        [ Font.external
            { name = "Amatic SC"
            , url = "https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&display=swap"
            }
        ]


size : Int -> Attribute msg
size =
    Font.size


underline : Attribute msg
underline =
    Font.underline
