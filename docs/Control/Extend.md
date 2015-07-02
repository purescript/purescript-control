## Module Control.Extend

This module defines the `Extend` type class and associated helper functions.

#### `Extend`

``` purescript
class (Functor w) <= Extend w where
  extend :: forall b a. (w a -> b) -> w a -> w b
```

The `Extend` class defines the extension operator `(<<=)`
which extends a local context-dependent computation to
a global computation.

`Extend` is the dual of `Bind`, and `(<<=)` is the dual of
`(>>=)`.

Laws:

- Associativity: `extend f <<< extend g = extend (f <<< extend g)`

##### Instances
``` purescript
instance extendFn :: (Semigroup w) => Extend (Function w)
```

#### `(<<=)`

``` purescript
(<<=) :: forall w a b. (Extend w) => (w a -> b) -> w a -> w b
```

_right-associative / precedence 1_

An infix version of `extend`

#### `(=>>)`

``` purescript
(=>>) :: forall b a w. (Extend w) => w a -> (w a -> b) -> w b
```

_left-associative / precedence 1_

A version of `(<<=)` with its arguments flipped.

#### `(=>=)`

``` purescript
(=>=) :: forall b a w c. (Extend w) => (w a -> b) -> (w b -> c) -> w a -> c
```

_right-associative / precedence 1_

Forwards co-Kleisli composition.

#### `(=<=)`

``` purescript
(=<=) :: forall b a w c. (Extend w) => (w b -> c) -> (w a -> b) -> w a -> c
```

_right-associative / precedence 1_

Backwards co-Kleisli composition.

#### `duplicate`

``` purescript
duplicate :: forall a w. (Extend w) => w a -> w (w a)
```

Duplicate a comonadic context.

`duplicate` is dual to `Control.Bind.join`.


