module Fact where
import Numeric.Natural

fact :: Natural -> Natural
fact = _fact 1
  where _fact acc 0 = acc
        _fact acc n = _fact (acc*n) (n-1)

{-
 - A definição anterior suportava números negativos, resultando em erro:
 -
 - fact :: Integral a => a -> a
 -}
