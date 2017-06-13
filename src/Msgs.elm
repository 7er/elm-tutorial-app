module Msgs exposing (..)

import RemoteData exposing (WebData)

import Models exposing (Player)

import Navigation exposing (Location)

type Msg
    = OnFetchPlayers (WebData (List Player))
    | OnLocationChange Location
