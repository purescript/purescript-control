module Control.Lazy where

class Lazy a where
  defer :: (Unit -> a) -> a

class Lazy1 a where
  defer1 :: forall t. (Unit -> a t) -> a t
