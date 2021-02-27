module Control.Lazy where

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

-- | `fix` defines a value as the fixed point of a function.
-- |
-- | The `Lazy` instance allows us to generate the result lazily.
-- |
-- | Example:
-- | ```purs
-- | fib :: Int -> Int
-- | fib = fix go
-- |   where
-- |     go :: (Int -> Int) -> Int -> Int
-- |     go _ 0 = 0
-- |     go _ 1 = 1
-- |     go f n = f (n - 1) + f (n - 2)
-- | ```
fix :: forall l. Lazy l => (l -> l) -> l
fix f = go
  where
    go = defer \_ -> f go
