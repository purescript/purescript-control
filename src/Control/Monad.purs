module Control.Monad where

replicateM :: forall m a. (Monad m) => Number -> m a -> m [a]
replicateM 0 _ = return []
replicateM n m = do
  a <- m
  as <- replicateM (n - 1) m
  return (a : as)

foldM :: forall m a b. (Monad m) => (a -> b -> m a) -> a -> [b] -> m a
foldM _ a [] = return a
foldM f a (b:bs) = f a b >>= \a' -> foldM f a' bs

when :: forall m. (Monad m) => Boolean -> m {} -> m {}
when true m = m
when false _ = return {}

unless :: forall m. (Monad m) => Boolean -> m {} -> m {}
unless false m = m
unless true _ = return {}
