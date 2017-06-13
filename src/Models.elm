module Models exposing (..)


type alias Model =
    { players : List Player 
    }     

type alias PlayerId =
    String


type alias Player =
    { id : PlayerId
    , name : String
    , level : Int
    }

initialModel : Model
initialModel = { players = [ Player "1" "Sam" 1 ] }