-- | This module defines helper functions for working with `Monad` instances.

module Control.Monad where

import Prelude

-- | Perform a monadic action when a condition is true.
when :: forall m. (Monad m) => Boolean -> m Unit -> m Unit
when true m = m
when false _ = return unit

-- | Perform a monadic action unless a condition is true.
unless :: forall m. (Monad m) => Boolean -> m Unit -> m Unit
unless false m = m
unless true _ = return unit

