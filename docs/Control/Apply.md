## Module Control.Apply

This module defines helper functions for working with `Apply` instances.

#### `(<*)`

``` purescript
(<*) :: forall a b f. (Apply f) => f a -> f b -> f a
```

_left-associative / precedence 4_

Combine two effectful actions, keeping only the result of the first.

#### `(*>)`

``` purescript
(*>) :: forall a b f. (Apply f) => f a -> f b -> f b
```

_left-associative / precedence 4_

Combine two effectful actions, keeping only the result of the second.

#### `lift2`

``` purescript
lift2 :: forall a b c f. (Apply f) => (a -> b -> c) -> f a -> f b -> f c
```

Lift a function of two arguments to a function which accepts and returns
values wrapped with the type constructor `f`.

#### `lift3`

``` purescript
lift3 :: forall a b c d f. (Apply f) => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
```

Lift a function of three arguments to a function which accepts and returns
values wrapped with the type constructor `f`.

#### `lift4`

``` purescript
lift4 :: forall a b c d e f. (Apply f) => (a -> b -> c -> d -> e) -> f a -> f b -> f c -> f d -> f e
```

Lift a function of four arguments to a function which accepts and returns
values wrapped with the type constructor `f`.

#### `lift5`

``` purescript
lift5 :: forall a b c d e f g. (Apply f) => (a -> b -> c -> d -> e -> g) -> f a -> f b -> f c -> f d -> f e -> f g
```

Lift a function of five arguments to a function which accepts and returns
values wrapped with the type constructor `f`.


