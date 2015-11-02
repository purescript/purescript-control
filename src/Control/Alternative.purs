-- | This module defines the `Alternative` type class and associated
-- | helper functions.

module Control.Alternative where

import Prelude

import Control.Plus (Plus)

-- | The `Alternative` type class has no members of its own; it just specifies
-- | that the type constructor has both `Applicative` and `Plus` instances.
-- |
-- | Types which have `Alternative` instances should also satisfy the following
-- | laws:
-- |
-- | - Distributivity: `(f <|> g) <*> x == (f <*> x) <|> (g <*> x)`
-- | - Annihilation: `empty <*> f = empty`
class (Applicative f, Plus f) <= Alternative f

instance alternativeArray :: Alternative Array
