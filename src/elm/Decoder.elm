module Decoder exposing (..)

import Json.Decode exposing (..)
import Json.Decode.Pipeline as DecodePipeline exposing (required)

import Types exposing (..)

modelDecoder : Decoder String
modelDecoder = string

projectDecoder : Decoder Project
projectDecoder =
  DecodePipeline.decode Project
    |> required "name" string
    |> required "description" string
    |> required "models" (list modelDecoder)


userDecoder : Decoder User
userDecoder =
  DecodePipeline.decode User
    |> required "first_name" string
    |> required "last_name" string
    |> required "username" string
    |> required "email" string

