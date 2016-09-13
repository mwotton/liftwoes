{-# LANGUAGE TemplateHaskell #-}

module Instances where

import Data.Data
import qualified Data.Text as T
import qualified Data.Set as HS
import Language.Haskell.TH.Syntax

liftText :: T.Text -> Q Exp
liftText txt = AppE (VarE 'T.pack) <$> lift (T.unpack txt)

liftDataWithText :: Data a => a -> Q Exp
liftDataWithText = dataToExpQ (\a -> liftText <$> cast a)

instance (Data a, Ord a) => Lift (HS.Set a) where
  lift = liftDataWithText
