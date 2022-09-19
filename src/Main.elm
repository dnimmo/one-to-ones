module Main exposing (main)

import Browser
import Browser.Navigation as Navigation
import Element exposing (..)
import Home
import Url exposing (Url)



-- MODEL


type alias Model =
    { navKey : Navigation.Key
    , state : State
    }


type State
    = ViewingHomePage



-- UPDATE


type Msg
    = UrlChanged Url
    | UrlRequested Browser.UrlRequest


handleUrlChange : Model -> Url -> ( Model, Cmd Msg )
handleUrlChange model url =
    -- case Route.fromUrl url of
    --     Route.Home ->
    ( { model | state = ViewingHomePage }
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
