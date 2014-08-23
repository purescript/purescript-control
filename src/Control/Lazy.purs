module Control.Lazy where

class Lazy l where
  defer :: (Unit -> l) -> l

class Lazy1 l where
  defer1 :: forall a. (Unit -> l a) -> l a

class Lazy2 l where
  defer2 :: forall a b. (Unit -> l a b) -> l a b

fix :: forall l a. (Lazy l) => (l -> l) -> l
fix f = defer (\_ -> f (fix f))

fix1 :: forall l a. (Lazy1 l) => (l a -> l a) -> l a
fix1 f = defer1 (\_ -> f (fix1 f))

fix2 :: forall l a b. (Lazy2 l) => (l a b -> l a b) -> l a b
fix2 f = defer2 (\_ -> f (fix2 f))
