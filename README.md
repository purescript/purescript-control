# v0.2.0 Breaking change note

If you are have a conflict between `<|>` in `Prelude` and `Control.Alt` please update your `psc` to 0.5.4.1.

---

# Module Documentation

## Module Control.Alt

### Type Classes

    class (Functor f) <= Alt f where
      (<|>) :: forall a. f a -> f a -> f a


## Module Control.Alternative

### Type Classes

    class (Applicative f, Plus f) <= Alternative f where


### Values

    many :: forall f a. (Alternative f, Lazy1 f) => f a -> f [a]

    some :: forall f a. (Alternative f, Lazy1 f) => f a -> f [a]


## Module Control.Apply

### Values

    (*>) :: forall a b f. (Apply f) => f a -> f b -> f b

    (<*) :: forall a b f. (Apply f) => f a -> f b -> f a

    forever :: forall a b f. (Apply f) => f a -> f b

    lift2 :: forall a b c f. (Apply f) => (a -> b -> c) -> f a -> f b -> f c

    lift3 :: forall a b c d f. (Apply f) => (a -> b -> c -> d) -> f a -> f b -> f c -> f d

    lift4 :: forall a b c d e f. (Apply f) => (a -> b -> c -> d -> e) -> f a -> f b -> f c -> f d -> f e

    lift5 :: forall a b c d e f g. (Apply f) => (a -> b -> c -> d -> e -> g) -> f a -> f b -> f c -> f d -> f e -> f g


## Module Control.Bind

### Values

    (<=<) :: forall a b c m. (Bind m) => (b -> m c) -> (a -> m b) -> a -> m c

    (=<<) :: forall a b m. (Bind m) => (a -> m b) -> m a -> m b

    (>=>) :: forall a b c m. (Bind m) => (a -> m b) -> (b -> m c) -> a -> m c

    ifM :: forall a m. (Bind m) => m Boolean -> m a -> m a -> m a

    join :: forall a m. (Bind m) => m (m a) -> m a


## Module Control.Comonad

### Type Classes

    class (Extend w) <= Comonad w where
      extract :: forall a. w a -> a


## Module Control.Extend

### Type Classes

    class (Functor w) <= Extend w where
      (<<=) :: forall b a. (w a -> b) -> w a -> w b


### Type Class Instances

    instance extendArr :: (Semigroup w) => Extend (Prim.Function w)


### Values

    (=<=) :: forall b a w c. (Extend w) => (w b -> c) -> (w a -> b) -> w a -> c

    (=>=) :: forall b a w c. (Extend w) => (w a -> b) -> (w b -> c) -> w a -> c

    (=>>) :: forall b a w. (Extend w) => w a -> (w a -> b) -> w b

    duplicate :: forall a w. (Extend w) => w a -> w (w a)


## Module Control.Lazy

### Type Classes

    class Lazy l where
      defer :: (Unit -> l) -> l

    class Lazy1 l where
      defer1 :: forall a. (Unit -> l a) -> l a

    class Lazy2 l where
      defer2 :: forall a b. (Unit -> l a b) -> l a b


### Values

    fix :: forall l a. (Lazy l) => (l -> l) -> l

    fix1 :: forall l a. (Lazy1 l) => (l a -> l a) -> l a

    fix2 :: forall l a b. (Lazy2 l) => (l a b -> l a b) -> l a b


## Module Control.Monad

### Values

    foldM :: forall m a b. (Monad m) => (a -> b -> m a) -> a -> [b] -> m a

    replicateM :: forall m a. (Monad m) => Number -> m a -> m [a]

    unless :: forall m. (Monad m) => Boolean -> m Unit -> m Unit

    when :: forall m. (Monad m) => Boolean -> m Unit -> m Unit


## Module Control.MonadPlus

### Type Classes

    class (Monad m, Alternative m) <= MonadPlus m where


### Values

    guard :: forall m. (MonadPlus m) => Boolean -> m Unit


## Module Control.Plus

### Type Classes

    class (Alt f) <= Plus f where
      empty :: forall a. f a
