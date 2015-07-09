-- | This module defines the `Comonad` type class.

module Control.Comonad
  ( module Control.Comonad
  , module Control.Extend
  ) where

import Prelude

import Control.Extend

-- | `Comonad` extends the `Extend` class with the `extract` function
-- | which extracts a value, discarding the comonadic context.
-- |
-- | `Comonad` is the dual of `Monad`, and `extract` is the dual of
-- | `pure` or `return`.
-- |
-- | Laws:
-- |
-- | - Left Identity: `extract <<= xs = xs`
-- | - Right Identity: `extract (f <<= xs) = f xs`
class (Extend w) <= Comonad w where
  extract :: forall a. w a -> a
