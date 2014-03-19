module Control.Monad where

import Prelude
import Data.Array
import Data.Traversable

zipWithA :: forall m a b c. (Applicative m) => (a -> b -> m c) -> [a] -> [b] -> m [c]
zipWithA f xs ys = sequence (zipWith f xs ys)

replicateM :: forall m a. (Monad m) => Number -> m a -> m [a]
replicateM 0 _ = return []
replicateM n m = do
  a <- m
  as <- replicateM (n - 1) m
  return (a : as)

infixr 1 >=>
infixr 1 <=<

(>=>) :: forall m a b c. (Monad m) => (a -> m b) -> (b -> m c) -> a -> m c
(>=>) f g a = do
  b <- f a
  g b

(<=<) :: forall m a b c. (Monad m) => (b -> m c) -> (a -> m b) -> a -> m c
(<=<) = flip (>=>)

join :: forall m a. (Monad m) => m (m a) -> m a
join mm = do
  m <- mm
  m

foldM :: forall m a b. (Monad m) => (a -> b -> m a) -> a -> [b] -> m a
foldM _ a [] = return a
foldM f a (b:bs) = f a b >>= \a' -> foldM f a' bs

when :: forall m. (Monad m) => Boolean -> m {} -> m {}
when true m = m
when false _ = return {}
