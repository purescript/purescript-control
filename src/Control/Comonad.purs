module Control.Comonad
  ( class Comonad, extract
  , module Control.Extend
  , module Data.Functor
  ) where

import Control.Extend (class Extend, duplicate, extend, (<<=), (=<=), (=>=), (=>>))

import Data.Functor (class Functor, map, void, ($>), (<#>), (<$), (<$>))
import Data.Monoid (class Monoid, mempty)

-- | `Comonad` extends the `Extend` class with the `extract` function
-- | which extracts a value, discarding the comonadic context.
-- |
-- | `Comonad` is the dual of `Monad`, and `extract` is the dual of `pure`.
-- |
-- | Laws:
-- |
-- | - Left Identity: `extract <<= xs = xs`
-- | - Right Identity: `extract (f <<= xs) = f xs`
class Extend w <= Comonad w where
  extract :: forall a. w a -> a

instance comonadFn :: Monoid m => Comonad ((->) m) where
  extract f = f mempty