module Control.MonadPlus where

import Control.Alternative
import Control.Plus

class (Monad m, Alternative m) <= MonadPlus m

guard :: forall m. (MonadPlus m) => Boolean -> m Unit
guard true = return unit
guard false = empty

mfilter :: forall m a. (MonadPlus m) => (a -> Boolean) -> m a -> m a
mfilter p v = v >>= \a -> if p a then pure a else empty
