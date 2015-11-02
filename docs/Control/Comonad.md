## Module Control.Comonad

This module defines the `Comonad` type class.

#### `Comonad`

``` purescript
class (Extend w) <= Comonad w where
  extract :: forall a. w a -> a
```

`Comonad` extends the `Extend` class with the `extract` function
which extracts a value, discarding the comonadic context.

`Comonad` is the dual of `Monad`, and `extract` is the dual of
`pure` or `return`.

Laws:

- Left Identity: `extract <<= xs = xs`
- Right Identity: `extract (f <<= xs) = f xs`


