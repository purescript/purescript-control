module Control.Bind where

  infixr 1 =<<
  infixr 1 >=>
  infixr 1 <=<

  (=<<) :: forall a b m. (Bind m) => (a -> m b) -> m a -> m b
  (=<<) f m = m >>= f

  (>=>) :: forall a b c m. (Bind m) => (a -> m b) -> (b -> m c) -> a -> m c
  (>=>) f g a = f a >>= g

  (<=<) :: forall a b c m. (Bind m) => (b -> m c) -> (a -> m b) -> a -> m c
  (<=<) f g a = f =<< g a

  join :: forall a m. (Bind m) => m (m a) -> m a
  join m = m >>= id

  ifM :: forall a m. (Bind m) => m Boolean -> m a -> m a -> m a
  ifM cond t f = cond >>= \cond' -> if cond' then t else f
