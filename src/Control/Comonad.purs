module Control.Comonad where

import Control.Extend

class (Extend w) <= Comonad w where
  extract :: forall a. w a -> a
