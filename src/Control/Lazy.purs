module Control.Lazy where

import Prelude

-- | The `Lazy` class represents types which allow evaluation of values
-- | to be _deferred_.
-- |
-- | Usually, this means that a type contains a function arrow which can
-- | be used to delay evaluation.
class Lazy l where
  defer :: (Unit -> l) -> l

-- | `deferFunctor` can be used to define a trivial `defer` for any Functor
deferFunctor :: forall l a. Functor l => Lazy a => (Unit -> l a) -> l a
deferFunctor f = ((map (defer <<< const)) <$> f) unit

-- | `fix` defines a value as the fixed point of a function.
-- |
-- | The `Lazy` instance allows us to generate the result lazily.
fix :: forall l. Lazy l => (l -> l) -> l
fix f = defer (\_ -> f (fix f))
