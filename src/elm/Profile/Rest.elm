module Profile.Rest exposing (..)

import Http
import Json.Encode as Encode
import Json.Decode as Decode

import Profile.Types exposing (..)
import Helpers.Rest
import Config exposing (apiUrl)
import Decoder exposing (projectDecoder)

createProject : ProjectForm -> String -> Cmd Msg
createProject { name, description } accessToken =
  let
    projectData = Encode.object
      [ ("name", Encode.string name)
      , ("description", Encode.string description)
      ]
  in
    Helpers.Rest.secureRequest CreateProjectResult 
      { url = apiUrl ++ "/projects"
      , body = Http.jsonBody projectData
      , decoder = projectDecoder
      , method = "POST"
      , accessToken = accessToken
      }

deleteProject : String -> String -> Cmd Msg
deleteProject projectId accessToken =
  Helpers.Rest.secureRequest DeleteProjectResult
    { url = apiUrl ++ "/projects/" ++ projectId
    , body = Http.emptyBody
    , decoder = Decode.field "success" Decode.bool
    , method = "DELETE"
    , accessToken = accessToken
    } |> Cmd.map (\result -> result projectId)