# Module Documentation

## Module Control.Extend


This module defines the `Extend` type class and associated helper functions.

#### `Extend`

``` purescript
class (Functor w) <= Extend w where
  (<<=) :: forall b a. (w a -> b) -> w a -> w b
```

The `Extend` class defines the extension operator `(<<=)`
which extends a local context-dependent computation to
a global computation.

`Extend` is the dual of `Bind`, and `(<<=)` is the dual of 
`(>>=)`.

Laws:

- Associativity: `extend f <<< extend g = extend (f <<< extend g)`

#### `extendArr`

``` purescript
instance extendArr :: (Semigroup w) => Extend (Prim.Function w)
```


#### `(=>>)`

``` purescript
(=>>) :: forall b a w. (Extend w) => w a -> (w a -> b) -> w b
```

A version of `(<<=)` with its arguments flipped.

#### `(=>=)`

``` purescript
(=>=) :: forall b a w c. (Extend w) => (w a -> b) -> (w b -> c) -> w a -> c
```

Forwards co-Kleisli composition.

#### `(=<=)`

``` purescript
(=<=) :: forall b a w c. (Extend w) => (w b -> c) -> (w a -> b) -> w a -> c
```

Backwards co-Kleisli composition.

#### `extend`

``` purescript
extend :: forall b a w. (Extend w) => (w a -> b) -> w a -> w b
```

An alias for `(<<=)`.

#### `duplicate`

``` purescript
duplicate :: forall a w. (Extend w) => w a -> w (w a)
```

Duplicate a comonadic context.

`duplicate` is dual to `Control.Bind.join`.



