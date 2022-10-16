module Action exposing (Action, details, init, isComplete)


type Action
    = Action ActionType ActionDetails


type alias ActionDetails =
    { description : String }


type ActionType
    = ToDo
    | Completed


details : Action -> ActionDetails
details (Action _ d) =
    d


isComplete : Action -> Bool
isComplete (Action t _) =
    case t of
        ToDo ->
            False

        Completed ->
            True


init : Action
init =
    -- This will eventually be a decoder, but for now just do a dummy action thing
    Action ToDo { description = "My action" }
