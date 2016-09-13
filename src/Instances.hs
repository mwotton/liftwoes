module Instances where

import           Data.Data
import qualified Data.Set                   as HS
import           Language.Haskell.TH.Syntax

instance (Data a,Ord a) => Lift (HS.Set a) where
  lift = liftData
