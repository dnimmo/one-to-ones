module User exposing
    ( User
    , actions
    , directReports
    , firstName
    , init
    )

import Action exposing (Action)
import DirectReport exposing (DirectReport)


type User
    = User
        { name :
            { first : String
            , last : String
            }
        , directReports : List DirectReport
        , actions : List Action
        }


firstName : User -> String
firstName (User { name }) =
    name.first


directReports : User -> List DirectReport
directReports (User details) =
    details.directReports


actions : User -> List Action
actions (User details) =
    details.actions


init : User
init =
    -- This will eventually be a decoder, but for now just do a dummy user thing
    User
        { name =
            { first = "Nimmo"
            , last = ""
            }
        , directReports =
            [ DirectReport.init
            , DirectReport.init
            , DirectReport.init
            ]
        , actions =
            [ Action.init
            , Action.init
            , Action.init
            ]
        }
