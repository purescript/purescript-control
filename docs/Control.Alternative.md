# Module Documentation

## Module Control.Alternative


This module defines the `Alternative` type class and associated
helper functions.

#### `Alternative`

``` purescript
class (Applicative f, Plus f) <= Alternative f where
```

The `Alternative` type class has no members of its own; it just specifies
that the type constructor has both `Applicative` and `Plus` instances.

Types which have `Alternative` instances should also satisfy the following
laws:

- Distributivity: `(f <|> g) <*> x == (f <*> x) <|> (g <*> x)`
- Annihilation: `empty <*> f = empty`

#### `some`

``` purescript
some :: forall f a. (Alternative f, Lazy (f [a])) => f a -> f [a]
```

Attempt a computation multiple times, requiring at least one success.

The `Lazy` constraint is used to generate the result lazily, to ensure
termination.

#### `many`

``` purescript
many :: forall f a. (Alternative f, Lazy (f [a])) => f a -> f [a]
```

Attempt a computation multiple times, returning as many successful results
as possible (possibly zero).

The `Lazy` constraint is used to generate the result lazily, to ensure
termination.



