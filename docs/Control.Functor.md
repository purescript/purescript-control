# Module Documentation

## Module Control.Functor


This module defines helper functions for working with `Functor` instances.

#### `(<$)`

``` purescript
(<$) :: forall f a b. (Functor f) => a -> f b -> f a
```

Ignore the return value of a computation, using the specified return value instead.

#### `($>)`

``` purescript
($>) :: forall f a b. (Functor f) => f a -> b -> f b
```

A version of `(<$)` with its arguments flipped.



