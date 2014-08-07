module Control.Alternative where

import Control.Alt
import Control.Lazy
import Control.Plus

class (Applicative f, Plus f) <= Alternative f

some :: forall f a. (Alternative f, Lazy1 f) => f a -> f [a]
some v = (:) <$> v <*> defer1 (\_ -> many v)

many :: forall f a. (Alternative f, Lazy1 f) => f a -> f [a]
many v = some v <|> pure []

