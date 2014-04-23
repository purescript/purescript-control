module Control.Apply where

  infixl 4 <*
  infixl 4 *>

  (<*) :: forall a b f. (Apply f) => f a -> f b -> f a
  (<*) a b = const <$> a <*> b

  (*>) :: forall a b f. (Apply f) => f a -> f b -> f b
  (*>) a b = const id <$> a <*> b

  lift2 :: forall a b c f. (Apply f) => (a -> b -> c) -> f a -> f b -> f c
  lift2 f a b = f <$> a <*> b

  lift3 :: forall a b c d f. (Apply f) => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
  lift3 f a b c = f <$> a <*> b <*> c

  lift4 :: forall a b c d e f. (Apply f) => (a -> b -> c -> d -> e) -> f a -> f b -> f c -> f d -> f e
  lift4 f a b c d = f <$> a <*> b <*> c <*> d

  lift5 :: forall a b c d e f g. (Apply f) => (a -> b -> c -> d -> e -> g) -> f a -> f b -> f c -> f d -> f e -> f g
  lift5 f a b c d e = f <$> a <*> b <*> c <*> d <*> e

  forever :: forall a b f. (Apply f) => f a -> f b
  forever a = a *> forever a
