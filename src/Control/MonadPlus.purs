module Control.MonadPlus where

import Control.Alternative
import Control.Plus

class (Monad m, Alternative m) <= MonadPlus m

guard :: forall m. (MonadPlus m) => Boolean -> m Unit
guard true = return unit
guard false = empty
