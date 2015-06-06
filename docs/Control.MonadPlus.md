## Module Control.MonadPlus

This module defines the `MonadPlus` type class.

#### `MonadPlus`

``` purescript
class (Monad m, Alternative m) <= MonadPlus m
```

The `MonadPlus` type class has no members of its own; it just specifies
that the type has both `Monad` and `Alternative` instances.

Types which have `MonadPlus` instances should also satisfy the following
laws:

- Distributivity: `(x <|> y) >>= f == (x >>= f) <|> (y >>= f)`
- Annihilation: `empty >>= f = empty`

##### Instances
``` purescript
instance monadPlusArray :: MonadPlus Array
```

#### `guard`

``` purescript
guard :: forall m. (MonadPlus m) => Boolean -> m Unit
```

Fail using `Plus` if a condition does not hold, or
succeed using `Monad` if it does.

For example:

```purescript
import Data.Array

factors :: Number -> Array Number
factors n = do
  a <- 1 .. n
  b <- 1 .. a
  guard $ a * b == n
  return a
```


