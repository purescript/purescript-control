module Control.Lazy where

import Prelude

import Data.Tuple (Tuple(..), fst, snd)
import Data.Unit (Unit, unit)

-- | The `Lazy` class represents types which allow evaluation of values
-- | to be _deferred_.
-- |
-- | Usually, this means that a type contains a function arrow which can
-- | be used to delay evaluation.
class Lazy l where
  defer :: (Unit -> l) -> l

instance lazyFn :: Lazy (a -> b) where
  defer f = \x -> f unit x

instance lazyUnit :: Lazy Unit where
  defer _ = unit
  
instance lazyTuple :: (Lazy a, Lazy b) => Lazy (Tuple a b) where
  defer f = Tuple (defer (fst <<< f)) (defer (snd <<< f))

-- | `fix` defines a value as the fixed point of a function.
-- |
-- | The `Lazy` instance allows us to generate the result lazily.
fix :: forall l. Lazy l => (l -> l) -> l
fix f = defer (\_ -> f (fix f))
