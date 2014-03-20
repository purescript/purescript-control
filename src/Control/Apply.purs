module Control.Apply where

  -- This should currently replace everything in Control.Applicative.
  -- Ideally it would be its superclass.

  infixl 4 <.
  infixl 4 .>

  -- This should be a subclass of Functor.
  class Apply f where
    -- Until we get default implementations, use `<.>` as `<*>`
    (<.>) :: forall a b. (Functor f) => f (a -> b) -> f a -> f b

  (<.) :: forall a b f. (Apply f, Functor f) => f a -> f b -> f a
  (<.) a b = const <$> a <.> b

  (.>) :: forall a b f. (Apply f, Functor f) => f a -> f b -> f b
  (.>) a b = const id <$> a <.> b

  lift2 :: forall a b c f. (Apply f, Functor f) => (a -> b -> c) -> f a -> f b -> f c
  lift2 f a b = f <$> a <.> b

  lift3 :: forall a b c d f. (Apply f, Functor f) => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
  lift3 f a b c = f <$> a <.> b <.> c
