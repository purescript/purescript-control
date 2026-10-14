module Test.Main (main) where

import Data.Unit (Unit)
import Effect (Effect)
import Test.Control.Lazy (testLazy)

main :: Effect Unit
main = testLazy
