# Module Documentation

## Module Control.Alt

#### `Alt`

``` purescript
class (Functor f) <= Alt f where
  (<|>) :: forall a. f a -> f a -> f a
```

The `Alt` type class identifies an associative operation on a type
constructor.  It is similar to `Semigroup`, except that it applies to
types of kind `* -> *`, like `Array` or `List`, rather than concrete types
`String` or `Number`.

`Alt` instances are required to satisfy the following laws:

- Associativity: `(x <|> y) <|> z == x <|> (y <|> z)`
- Distributivity: `f <$> (x <|> y) == (f <$> x) <|> (f <$> y)`

For example, the `Array` (`[]`) type is an instance of `Alt`, where
`(<|>)` is defined to be concatenation.


## Module Control.Alternative

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
some :: forall f a. (Alternative f, Lazy1 f) => f a -> f [a]
```


#### `many`

``` purescript
many :: forall f a. (Alternative f, Lazy1 f) => f a -> f [a]
```



## Module Control.Apply

#### `(<*)`

``` purescript
(<*) :: forall a b f. (Apply f) => f a -> f b -> f a
```


#### `(*>)`

``` purescript
(*>) :: forall a b f. (Apply f) => f a -> f b -> f b
```


#### `lift2`

``` purescript
lift2 :: forall a b c f. (Apply f) => (a -> b -> c) -> f a -> f b -> f c
```


#### `lift3`

``` purescript
lift3 :: forall a b c d f. (Apply f) => (a -> b -> c -> d) -> f a -> f b -> f c -> f d
```


#### `lift4`

``` purescript
lift4 :: forall a b c d e f. (Apply f) => (a -> b -> c -> d -> e) -> f a -> f b -> f c -> f d -> f e
```


#### `lift5`

``` purescript
lift5 :: forall a b c d e f g. (Apply f) => (a -> b -> c -> d -> e -> g) -> f a -> f b -> f c -> f d -> f e -> f g
```


#### `forever`

``` purescript
forever :: forall a b f. (Apply f) => f a -> f b
```



## Module Control.Bind

#### `(=<<)`

``` purescript
(=<<) :: forall a b m. (Bind m) => (a -> m b) -> m a -> m b
```


#### `(>=>)`

``` purescript
(>=>) :: forall a b c m. (Bind m) => (a -> m b) -> (b -> m c) -> a -> m c
```


#### `(<=<)`

``` purescript
(<=<) :: forall a b c m. (Bind m) => (b -> m c) -> (a -> m b) -> a -> m c
```


#### `join`

``` purescript
join :: forall a m. (Bind m) => m (m a) -> m a
```


#### `ifM`

``` purescript
ifM :: forall a m. (Bind m) => m Boolean -> m a -> m a -> m a
```



## Module Control.Comonad

#### `Comonad`

``` purescript
class (Extend w) <= Comonad w where
  extract :: forall a. w a -> a
```



## Module Control.Extend

#### `Extend`

``` purescript
class (Functor w) <= Extend w where
  (<<=) :: forall b a. (w a -> b) -> w a -> w b
```


#### `extendArr`

``` purescript
instance extendArr :: (Semigroup w) => Extend (Prim.Function w)
```


#### `(=>>)`

``` purescript
(=>>) :: forall b a w. (Extend w) => w a -> (w a -> b) -> w b
```


#### `(=>=)`

``` purescript
(=>=) :: forall b a w c. (Extend w) => (w a -> b) -> (w b -> c) -> w a -> c
```


#### `(=<=)`

``` purescript
(=<=) :: forall b a w c. (Extend w) => (w b -> c) -> (w a -> b) -> w a -> c
```


#### `duplicate`

``` purescript
duplicate :: forall a w. (Extend w) => w a -> w (w a)
```



## Module Control.Functor

#### `(<$)`

``` purescript
(<$) :: forall f a b. (Functor f) => a -> f b -> f a
```


#### `($>)`

``` purescript
($>) :: forall f a b. (Functor f) => f a -> b -> f b
```



## Module Control.Lazy

#### `Lazy`

``` purescript
class Lazy l where
  defer :: (Unit -> l) -> l
```


#### `Lazy1`

``` purescript
class Lazy1 l where
  defer1 :: forall a. (Unit -> l a) -> l a
```


#### `Lazy2`

``` purescript
class Lazy2 l where
  defer2 :: forall a b. (Unit -> l a b) -> l a b
```


#### `fix`

``` purescript
fix :: forall l a. (Lazy l) => (l -> l) -> l
```


#### `fix1`

``` purescript
fix1 :: forall l a. (Lazy1 l) => (l a -> l a) -> l a
```


#### `fix2`

``` purescript
fix2 :: forall l a b. (Lazy2 l) => (l a b -> l a b) -> l a b
```



## Module Control.Monad

#### `replicateM`

``` purescript
replicateM :: forall m a. (Monad m) => Number -> m a -> m [a]
```


#### `foldM`

``` purescript
foldM :: forall m a b. (Monad m) => (a -> b -> m a) -> a -> [b] -> m a
```


#### `when`

``` purescript
when :: forall m. (Monad m) => Boolean -> m Unit -> m Unit
```


#### `unless`

``` purescript
unless :: forall m. (Monad m) => Boolean -> m Unit -> m Unit
```


#### `filterM`

``` purescript
filterM :: forall a m. (Monad m) => (a -> m Boolean) -> [a] -> m [a]
```



## Module Control.MonadPlus

#### `MonadPlus`

``` purescript
class (Monad m, Alternative m) <= MonadPlus m where
```

The `MonadPlus` type class has no members of its own; it just specifies
that the type has both `Monad` and `Alternative` instances.

Types which have `MonadPlus` instances should also satisfy the following
laws:

- Distributivity: `(x <|> y) >>= f == (x >>= f) <|> (y >>= f)`
- Annihilation: `empty >>= f = empty`

#### `guard`

``` purescript
guard :: forall m. (MonadPlus m) => Boolean -> m Unit
```



## Module Control.Plus

#### `Plus`

``` purescript
class (Alt f) <= Plus f where
  empty :: forall a. f a
```

The `Plus` type class extends the `Alt` type class with a value that
should be the left and right identity for `(<|>)`.
It is similar to `Monoid`, except that it applies to types of
kind `* -> *`, like `Array` or `List`, rather than concrete types like
`String` or `Number`.

`Plus` instances should satisfy the following laws:

- Left identity: `empty <|> x == x`
- Right identity: `x <|> empty == x`
- Annihilation: `f <$> empty == empty`