module Control.Alt where

infixl 3 <|>

-- | The `Alt` type class identifies an associative operation on a type.
-- | It is similar to `Semigroup`, except that it applies to types of
-- | kind (* -> *), like Array or List, rather than concrete types like
-- | String or Number.
-- |
-- | `Alt` instances are required to satisfy the following law:
-- |
-- | - Associativity: `(x <|> y) <|> z == x <|> (y <|> z)`
-- |
-- | For example, the `Array` (`[]`) type is an instance of `Alt`, where
-- | (<|>) is defined to be concatenation.
class (Functor f) <= Alt f where
  (<|>) :: forall a. f a -> f a -> f a
