module Test.Main (main) where

import Control.Monad.Eff (Eff)
import Data.Unit (Unit)

import Test.Control.Lazy (testLazy)

main :: Eff () Unit
main = testLazy
