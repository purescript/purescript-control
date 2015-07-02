## Module Control.Alt

This module defines the `Alt` type class.

#### `Alt`

``` purescript
class (Functor f) <= Alt f where
  alt :: forall a. f a -> f a -> f a
```

The `Alt` type class identifies an associative operation on a type
constructor.  It is similar to `Semigroup`, except that it applies to
types of kind `* -> *`, like `Array` or `List`, rather than concrete types
`String` or `Number`.

`Alt` instances are required to satisfy the following laws:

- Associativity: `(x <|> y) <|> z == x <|> (y <|> z)`
- Distributivity: `f <$> (x <|> y) == (f <$> x) <|> (f <$> y)`

For example, the `Array` (`[]`) type is an instance of `Alt`, where
`(<|>)` is defined to be concatenation.

##### Instances
``` purescript
instance altArray :: Alt Array
```

#### `(<|>)`

``` purescript
(<|>) :: forall f a. (Alt f) => f a -> f a -> f a
```

_left-associative / precedence 3_

An infix version of `alt`.


