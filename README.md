# Module Documentation

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

    ifM :: forall a m. (Bind m) => m Prim.Boolean -> m a -> m a -> m a

    join :: forall a m. (Bind m) => m (m a) -> m a



## Module Control.Monad

### Values

    foldM :: forall m a b. (Monad m) => (a -> b -> m a) -> a -> [b] -> m a

    replicateM :: forall m a. (Monad m) => Prim.Number -> m a -> m [a]

    unless :: forall m. (Monad m) => Prim.Boolean -> m {  } -> m {  }

    when :: forall m. (Monad m) => Prim.Boolean -> m {  } -> m {  }



