module Main exposing (main)

import Board
import Browser
import Browser.Navigation as Navigation
import Dashboard
import Element exposing (..)
import Home
import NotFound
import Route
import Url exposing (Url)



-- MODEL


type alias Model =
    { navKey : Navigation.Key
    , state : State
    }


type State
    = ViewingHomePage
    | ViewingDashboard Dashboard.Model
    | ViewingBoard Board.Model
    | ViewingNotFound



-- UPDATE


type Msg
    = UrlChanged Url
    | UrlRequested Browser.UrlRequest


handleUrlChange : Model -> Url -> ( Model, Cmd Msg )
handleUrlChange model url =
    case Route.fromUrl url of
        Route.Home ->
            ( { model | state = ViewingHomePage }
            , Cmd.none
            )

        Route.Dashboard ->
            ( { model | state = ViewingDashboard Dashboard.init }
            , Cmd.none
            )

        Route.Board directReportId ->
            ( { model | state = ViewingBoard <| Board.init directReportId }
            , Cmd.none
            )

        Route.NotFound ->
            ( { model | state = ViewingNotFound }
            , Cmd.none
            )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested (Browser.Internal url) ->
            ( model
            , Navigation.pushUrl model.navKey <| Url.toString url
            )

        UrlRequested (Browser.External urlString) ->
            ( model
            , Navigation.load urlString
            )

        UrlChanged url ->
            handleUrlChange model url



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "One to ones"
    , body =
        [ layout
            [ width fill
            , height fill
            ]
          <|
            case model.state of
                ViewingHomePage ->
                    Home.view

                ViewingDashboard dashboardModel ->
                    Dashboard.view dashboardModel

                ViewingBoard boardModel ->
                    Board.view boardModel

                ViewingNotFound ->
                    NotFound.view
        ]
    }



-- INIT


type alias Flags =
    { height : Int
    , width : Int
    }


init : Flags -> Url -> Navigation.Key -> ( Model, Cmd Msg )
init _ url navKey =
    handleUrlChange
        { navKey = navKey
        , state = ViewingHomePage
        }
        url


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = UrlRequested
        }
