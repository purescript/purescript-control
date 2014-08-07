module Control.Extend where

infixl 1 =>>
infixr 1 <<=
infixr 1 =>=
infixr 1 =<=

class (Functor w) <= Extend w where
  (<<=) :: forall b a. (w a -> b) -> w a -> w b

instance extendArr :: (Semigroup w) => Extend ((->) w) where
  (<<=) f g w = f \w' -> g (w <> w')

(=>>) :: forall b a w. (Extend w) => w a -> (w a -> b) -> w b
(=>>) w f = f <<= w

(=>=) :: forall b a w c. (Extend w) => (w a -> b) -> (w b -> c) -> w a -> c
(=>=) f g w = g (f <<= w)

(=<=) :: forall b a w c. (Extend w) => (w b -> c) -> (w a -> b) -> w a -> c
(=<=) f g w = f (g <<= w)

duplicate :: forall a w. (Extend w) => w a -> w (w a)
duplicate w = id <<= w
