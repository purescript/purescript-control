module Control.Plus where

import Control.Alt

-- | The `Plus` type class extends the `Alt` typeclass with a value that
-- | should be the left and right identity for `(<|>)`.
-- |
-- | `Plus` instances should satisfy the following laws:
-- |
-- | - Left identity: `empty <|> x == x`
-- | - Right identity: `x <|> empty == x`
class (Alt f) <= Plus f where
  empty :: forall a. f a
