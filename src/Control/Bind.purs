module Control.Bind where

  -- This should replace most things in Control.Monad.
  -- Ideally it would be its superclass.

  infixl 1 >>-

  import Control.Apply

  -- This should be a subclass of Apply
  class Bind m where
    -- We should be able to provide either one of these and derive the other.
    (>>-) :: forall a b. (Apply m) => m a -> (a -> m b) -> m b
    -- (>>-) m f = join (f <$> m)
    join :: forall a. (Apply m) => m (m a) -> m a
    -- join m = m >>- id

  instance applyFromBind :: (Bind m) => Apply m where
    (<.>) f a = f >>- \f' -> f' <$> a

  (-<<) :: forall a b m. (Apply m, Bind m) => (a -> m b) -> m a -> m b
  (-<<) f m = m >>- f

  (>->) :: forall a b c m. (Apply m, Bind m) => (a -> m b) -> (b -> m c) -> a -> m c
  (>->) f g a = f a >>- g

  (<-<) :: forall a b c m. (Apply m, Bind m) => (b -> m c) -> (a -> m b) -> a -> m c
  (<-<) f g a = f -<< g a

  ifM :: forall a m. (Apply m, Bind m) => m Boolean -> m a -> m a -> m a
  ifM cond t f = cond >>- \cond' -> if cond' then t else f

  forever :: forall a b m. (Apply m, Functor m, Bind m) => m a -> m b
  forever a = a .> forever a
