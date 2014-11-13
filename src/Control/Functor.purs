module Control.Functor where

infixl 4 <$
infixl 4 $>

(<$) :: forall f a b. (Functor f) => a -> f b -> f a
(<$) x f = const x <$> f

($>) :: forall f a b. (Functor f) => f a -> b -> f b
($>) f x = const x <$> f
