module View exposing (..)

import Html exposing (Html, div, text)
import Msgs exposing (Msg)
import Models exposing (Model, PlayerId)
import Players.Edit
import Players.List
import RemoteData


view : Model -> Html Msg
view model =
    div []
        [ page model ]

page : Model -> Html Msg
page model =
  case model.route of
    Models.PlayersRoute ->
      Players.List.view model.players
    Models.PlayerRoute id ->
      playerEditPage model id
    Models.NotFoundRoute ->
      notFoundView


playerEditPage : Model -> PlayerId -> Html Msg
playerEditPage model playerId =
  case model.players of
      RemoteData.NotAsked -> text ""
      RemoteData.Loading -> text "Loading ..."
      RemoteData.Failure err -> text (toString err)
      RemoteData.Success players ->
          let
              maybePlayer =
                  players
                      |> List.filter (\player -> player.id == playerId)
                      |> List.head
          in
              case maybePlayer of
                  Just player ->
                      Players.Edit.view player
                  Nothing ->
                      notFoundView


notFoundView : Html Msg
notFoundView =
    div [] [
      text "Not found"
    ]