module Data.FunctorF where

import Data.NaturalTransformation (type (~>))

-- | A type class for functors in the category of type constructors; types of
-- | kind `(* -> *) -> * -> *`.
-- |
-- | The mapping operation `hoist` allows the inner functor to be changed. This
-- | is similar to `map` for a `Functor`, only here we are transforming a
-- | functor rather than a value, so correspondingly we perform this with a
-- | natural transformation rather than a rank-1 function.
-- |
-- | Instances must satisfy the following laws:
-- |
-- | - Identity: `hoist id = id`
-- | - Composition: `hoist (f <<< g) = hoist f <<< hoist g`
class FunctorF t where
  hoist :: forall f g. (f ~> g) -> t f ~> t g
