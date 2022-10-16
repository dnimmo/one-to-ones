module NotFound exposing (view)

import Components
import Element exposing (..)


view : Element msg
view =
    Components.frame
        { title = "Something has gone wrong"
        , contents = [ text "Sorry, that page doesn't seem to exist." ]
        }
