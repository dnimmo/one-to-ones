module DirectReport exposing (DirectReport, init, name)

import Action exposing (Action)


type DirectReport
    = DirectReport
        { name : String
        , actions : List Action
        }


name : DirectReport -> String
name (DirectReport details) =
    details.name


init : DirectReport
init =
    -- This will actually be a decoder in reality, but for not, init a DR here
    DirectReport
        { name = "Some Direct Report"
        , actions = [ Action.init ]
        }
