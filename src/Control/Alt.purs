-- | This module defines the `Alt` type class.

module Control.Alt where

import Prelude

-- | The `Alt` type class identifies an associative operation on a type
-- | constructor.  It is similar to `Semigroup`, except that it applies to
-- | types of kind `* -> *`, like `Array` or `List`, rather than concrete types
-- | `String` or `Number`.
-- |
-- | `Alt` instances are required to satisfy the following laws:
-- |
-- | - Associativity: `(x <|> y) <|> z == x <|> (y <|> z)`
-- | - Distributivity: `f <$> (x <|> y) == (f <$> x) <|> (f <$> y)`
-- |
-- | For example, the `Array` (`[]`) type is an instance of `Alt`, where
-- | `(<|>)` is defined to be concatenation.
class (Functor f) <= Alt f where
  alt :: forall a. f a -> f a -> f a

infixl 3 <|>

-- | An infix version of `alt`.
(<|>) :: forall f a. (Alt f) => f a -> f a -> f a
(<|>) = alt

instance altArray :: Alt Array where
  alt = append
