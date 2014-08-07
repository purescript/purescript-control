module Control.Alternative where

import Control.Alt
import Control.Plus

class (Applicative f, Plus f) <= Alternative f

some :: forall f a. (Alternative f) => f a -> f [a]
some v = (:) <$> v <*> many v

many :: forall f a. (Alternative f) => f a -> f [a]
many v = some v <|> pure []
