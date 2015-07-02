## Module Data.Functor

This module defines helper functions for working with `Functor` instances.

#### `(<$)`

``` purescript
(<$) :: forall f a b. (Functor f) => a -> f b -> f a
```

_left-associative / precedence 4_

Ignore the return value of a computation, using the specified return value instead.

#### `($>)`

``` purescript
($>) :: forall f a b. (Functor f) => f a -> b -> f b
```

_left-associative / precedence 4_

A version of `(<$)` with its arguments flipped.


