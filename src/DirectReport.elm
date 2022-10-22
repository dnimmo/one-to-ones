module DirectReport exposing
    ( DirectReport
    , id
    , init
    , name
    )

import Action exposing (Action)


type DirectReport
    = DirectReport
        { name : String
        , actions : List Action
        , id : String
        }


name : DirectReport -> String
name (DirectReport details) =
    details.name


id : DirectReport -> String
id (DirectReport details) =
    details.id


init : DirectReport
init =
    -- This will actually be a decoder in reality, but for not, init a DR here
    DirectReport
        { name = "Some Direct Report"
        , actions = [ Action.init ]
        , id = "some-id"
        }
