module Test.Control.Lazy (testLazy) where

import Control.Applicative (pure)
import Control.Monad.Eff (Eff)
import Control.Lazy (fix)
import Data.Unit (Unit, unit)

foo :: Unit -> Unit
foo _ = unit

foofoo :: (Unit -> Unit) -> (Unit -> Unit)
foofoo _ = foo

foo' :: Unit -> Unit
foo' = fix foofoo

-- the idea here is that foo and foo' are the same function
testLazy :: Eff () Unit
testLazy = pure (foo' unit)
