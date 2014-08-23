module Control.Alt where

infixl 3 <|>

class (Functor f) <= Alt f where
  (<|>) :: forall a. f a -> f a -> f a
