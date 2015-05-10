## Module Control.Lazy

This module defines the `Lazy` type class and associated
helper functions.

#### `Lazy`

``` purescript
class Lazy l where
  defer :: (Unit -> l) -> l
```

The `Lazy` class represents types which allow evaluation of values
to be _deferred_.

Usually, this means that a type contains a function arrow which can
be used to delay evaluation.

#### `fix`

``` purescript
fix :: forall l a. (Lazy l) => (l -> l) -> l
```

`fix` defines a value as the fixed point of a function.

The `Lazy` instance allows us to generate the result lazily.


