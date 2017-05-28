module Test.Control.Lazy (testLazy) where

import Control.Applicative (pure)
import Control.Monad.Eff (Eff)
import Control.Lazy (fix)
import Data.Unit (Unit, unit)

foo :: forall a. a -> Unit
foo _ = unit

foofoo :: forall a b. a -> (b -> Unit)
foofoo _ = foo

foo' :: forall a. a -> Unit
foo' = fix foofoo

-- the idea here is that foo and foo' are the same function
testLazy :: Eff () Unit
testLazy = pure (foo' unit)
