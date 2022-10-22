module Board exposing (Model, init, view)

import Action exposing (Action)
import Components
import Element exposing (..)
import Element.Background as Background



-- MODEL


type alias Model =
    { directReportId : String
    , state : State
    }


type State
    = Ready (List Action)



-- UPDATE


update : Model -> Model
update model =
    model



-- VIEW


actionCard : Action -> Element msg
actionCard action =
    el
        [ Components.shadow
        , Background.color <| rgb255 255 255 255
        , width fill
        , padding 20
        , Components.roundedBorder
        ]
    <|
        paragraph []
            [ text <|
                .description <|
                    Action.details action
            ]


actionList : List Action -> Element msg
actionList actions =
    column
        [ spacing 20
        , width fill
        ]
    <|
        paragraph [] [ text "Actions for [name]" ]
            :: List.map actionCard actions


view : Model -> Element msg
view { directReportId, state } =
    Components.frame
        { title = "Viewing board for " ++ directReportId
        , contents =
            [ case state of
                Ready actions ->
                    column
                        [ width fill
                        , spacing 40
                        ]
                        [ text "To discuss here"
                        , actionList actions
                        , actionList actions
                        , text "Discussed here"
                        ]
            ]
        }



-- INIT


init : String -> Model
init directReportId =
    { directReportId = directReportId
    , state =
        Ready
            [ Action.init
            , Action.init
            , Action.init
            ]
    }
