module Messages exposing (Msg(..))

import Http
import Material

import Types exposing (..)
import Register.Types
import Login.Types
import Profile.Types

type Msg =
    Mdl (Material.Msg Msg)
  | UpdateRoute Route
  | RegisterMsg Register.Types.Msg
  | LoginMsg Login.Types.Msg
  | ProfileMsg Profile.Types.Msg
  | ProjectsResult (Result Http.Error (List Project))
