{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}
module Lib where

import           Data.Data
import qualified Data.Set                   as HS
import qualified Data.Text                  as T
import qualified Data.Text.IO               as T
import           Data.Time
import           Instances
import           Language.Haskell.TH.Syntax

table = $(do r <- runIO (HS.fromList . T.lines  <$> T.readFile "/usr/share/dict/words")
             [|r|] )

someFunc = do
  print $ HS.member "foo" table
