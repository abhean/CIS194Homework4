{-# OPTIONS_GHC -Wall #-}
module HW04 where

import Data.List

newtype Poly a = P [a]

-- Exercise 1 -----------------------------------------

x :: Num a => Poly a
x = P [0, 1]

-- Exercise 2 ----------------------------------------

canonicalForm :: (Num a, Eq a) => Poly a -> Poly a
canonicalForm (P c) = P (dropWhileEnd (0==) c)

--instance (Num a, Eq a) => Eq (Poly a) where
--    (==) p1 p2 = c1 == c2
--        where P c1 = canonicalForm p1
--              P c2 = canonicalForm p2

isZero :: (Num a, Eq a) => Poly a -> Bool
isZero (P []) = True
isZero (P (x:xs)) = (x == 0) && isZero (P xs)

instance (Num a, Eq a) => Eq (Poly a) where
    (==) (P []) py = isZero py
    (==) px (P []) = isZero px
    (==) (P (x:xs)) (P (y:ys)) = (x == y) && ((P xs) == (P ys))

-- Exercise 3 -----------------------------------------

instance (Num a, Eq a, Show a) => Show (Poly a) where
    show = undefined

-- Exercise 4 -----------------------------------------

plus :: Num a => Poly a -> Poly a -> Poly a
plus = undefined

-- Exercise 5 -----------------------------------------

times :: Num a => Poly a -> Poly a -> Poly a
times = undefined

-- Exercise 6 -----------------------------------------

instance Num a => Num (Poly a) where
    (+) = plus
    (*) = times
    negate      = undefined
    fromInteger = undefined
    -- No meaningful definitions exist
    abs    = undefined
    signum = undefined

-- Exercise 7 -----------------------------------------

applyP :: Num a => Poly a -> a -> a
applyP = undefined

-- Exercise 8 -----------------------------------------

class Num a => Differentiable a where
    deriv  :: a -> a
    nderiv :: Int -> a -> a
    nderiv = undefined

-- Exercise 9 -----------------------------------------

instance Num a => Differentiable (Poly a) where
    deriv = undefined

