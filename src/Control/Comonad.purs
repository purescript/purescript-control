-- | This module defines the `Comonad` type class

module Control.Comonad where

import Control.Extend

-- | `Comonad` extends the `Extend` class with the `extract` function
-- | which extracts a value, discarding the comonadic context.
-- | 
-- | Laws:
-- |
-- | - Left Identity: `extract <<= xs = xs`
-- | - Right Identity: `extract (f <<= xs) = f xs`
class (Extend w) <= Comonad w where
  extract :: forall a. w a -> a
