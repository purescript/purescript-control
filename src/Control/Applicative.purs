module Control.Applicative where

import Prelude

infixl 4 <*
infixl 4 *>

(<*) :: forall a b f. (Applicative f) => f a -> f b -> f a
(<*) x y = const <$> x <*> y

(*>) :: forall a b f. (Applicative f) => f a -> f b -> f b
(*>) x y = const id <$> x <*> y

lift2 :: forall a b c f. (Applicative f) => (a -> b -> c) -> f a -> f b -> f c
lift2 f x y = f <$> x <*> y

lift3 :: forall a b c d f. (Applicative f) => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
lift3 f x y z = f <$> x <*> y <*> z

zipWithA :: forall m a b c. (Applicative m) => (a -> b -> m c) -> [a] -> [b] -> m [c]
zipWithA f xs ys = sequence (zipWith f xs ys)
