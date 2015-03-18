module Control.MonadPlus where

import Control.Alternative
import Control.Plus

-- | The `MonadPlus` type class has no members of its own; it just specifies
-- | that the type has both `Monad` and `Alternative` instances.
-- |
-- | Types which have `MonadPlus` instances should also satisfy the following
-- | laws:
-- |
-- | - Distributivity: `(x <|> y) >>= f == (x >>= f) <|> (y >>= f)`
-- | - Annihilation: `empty >>= f = empty`
class (Monad m, Alternative m) <= MonadPlus m

guard :: forall m. (MonadPlus m) => Boolean -> m Unit
guard true = return unit
guard false = empty
