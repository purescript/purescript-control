# Module Documentation

## Module Control.Monad


This module defines helper functions for working with `Monad` instances.

#### `replicateM`

``` purescript
replicateM :: forall m a. (Monad m) => Int -> m a -> m [a]
```

Perform a monadic action `n` times collecting all of the results.

#### `foldM`

``` purescript
foldM :: forall m a b. (Monad m) => (a -> b -> m a) -> a -> [b] -> m a
```

Perform a fold using a monadic step function.

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

#### `filterM`

``` purescript
filterM :: forall a m. (Monad m) => (a -> m Boolean) -> [a] -> m [a]
```

Filter where the predicate returns a monadic `Boolean`.

For example:

```purescript
powerSet :: forall a. [a] -> [[a]]
powerSet = filterM (const [true, false])
```



