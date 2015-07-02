## Module Control.Bind

This module defines helper functions for working with `Bind` instances.

#### `(=<<)`

``` purescript
(=<<) :: forall a b m. (Bind m) => (a -> m b) -> m a -> m b
```

_right-associative / precedence 1_

A version of `(>>=)` with its arguments flipped.

#### `(>=>)`

``` purescript
(>=>) :: forall a b c m. (Bind m) => (a -> m b) -> (b -> m c) -> a -> m c
```

_right-associative / precedence 1_

Forwards Kleisli composition.

For example:

```purescript
import Data.Array (head, tail)

third = tail >=> tail >=> head
```

#### `(<=<)`

``` purescript
(<=<) :: forall a b c m. (Bind m) => (b -> m c) -> (a -> m b) -> a -> m c
```

_right-associative / precedence 1_

Backwards Kleisli composition.

#### `join`

``` purescript
join :: forall a m. (Bind m) => m (m a) -> m a
```

Collapse two applications of a monadic type constructor into one.

#### `ifM`

``` purescript
ifM :: forall a m. (Bind m) => m Boolean -> m a -> m a -> m a
```

Execute a monadic action if a condition holds.

For example:

```purescript
main = ifM ((< 0.5) <$> random)
         (trace "Heads")
         (trace "Tails")
```


