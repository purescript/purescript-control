module Control.Plus where

import Control.Alt

class (Alt f) <= Plus f where
  empty :: forall a. f a
