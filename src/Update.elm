module Update exposing (..)

import Msgs exposing (Msg)
import Models exposing (Model)
import Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case Debug.log "The message" msg of
        Msgs.OnFetchPlayers response ->
            ( { model | players = response }, Cmd.none)
        Msgs.OnLocationChange location ->            
            ( { model | route = (parseLocation location) }, Cmd.none)
