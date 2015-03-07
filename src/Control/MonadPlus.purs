module Control.MonadPlus where

import Control.Alternative
import Control.Plus

-- | The `MonadPlus` type class has none of its own functions; it just
-- | specifies that the type has both `Monad` and `Alternative` instances.
-- |
-- | Types which have `MonadPlus` instances should also satisfy the following
-- | law:
-- |
-- | - Left distributivity: `(x <|> y) >>= f == (x >>= f) <|> (y >>= f)`
class (Monad m, Alternative m) <= MonadPlus m

guard :: forall m. (MonadPlus m) => Boolean -> m Unit
guard true = return unit
guard false = empty
