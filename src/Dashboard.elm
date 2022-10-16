module Dashboard exposing (Model, init, view)

import Action exposing (Action)
import Components
import DirectReport exposing (DirectReport)
import Element exposing (..)
import Font
import Layout
import User exposing (User)


type Model
    = Model User -- TODO: State = FetchingDetails | DetailsLoaded



-- VIEW


directReports : List DirectReport -> Element msg
directReports reports =
    column [ Layout.verticalSpacing ]
        ((el [ Font.underline ] <| text "Your direct reports")
            :: (reports
                    |> List.map
                        (\x ->
                            text <| DirectReport.name x
                        )
               )
        )


actions : List Action -> Element msg
actions actionList =
    column [ Layout.verticalSpacing ]
        ((el [ Font.underline ] <| text "Your outstanding actions")
            :: (actionList
                    |> List.map Action.details
                    |> List.map
                        (\x ->
                            text x.description
                        )
               )
        )


view : Model -> Element msg
view (Model user) =
    Components.frame
        { title = "Dashboard"
        , contents =
            [ el [ Font.size 24 ] <|
                text <|
                    "Hi, "
                        ++ User.firstName user
                        ++ "!"
            , column [ Layout.verticalSpacing ]
                [ directReports <| User.directReports user
                , actions <| User.actions user
                ]
            ]
        }



-- INIT


init : Model
init =
    Model <| User.init
