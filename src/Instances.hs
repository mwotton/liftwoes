{-# LANGUAGE TemplateHaskell #-}

module Instances where

import           Data.Data
import           Data.Hashable
import qualified Data.HashSet               as HS
import qualified Data.Text                  as T
import           Language.Haskell.TH.Syntax

liftText :: T.Text -> Q Exp
liftText txt = AppE (VarE 'T.pack) <$> lift (T.unpack txt)

liftDataWithText :: Data a => a -> Q Exp
liftDataWithText = dataToExpQ (\a -> liftText <$> cast a)

instance (Data a, Eq a, Hashable a) => Lift (HS.HashSet a) where
  lift = liftDataWithText
