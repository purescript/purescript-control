## Module Control.Monad

This module defines helper functions for working with `Monad` instances.

#### `when`

``` purescript
when :: forall m. (Monad m) => Boolean -> m Unit -> m Unit
```

Perform a monadic action when a condition is true.

#### `unless`

``` purescript
unless :: forall m. (Monad m) => Boolean -> m Unit -> m Unit
```

Perform a monadic action unless a condition is true.


