-- The `Num` here says that `ty` can be any `Num` (numeric) type.
double : Num ty => ty -> ty
double x = x + x

-- Num here is a type constraint referred to as an interface
-- Num is an interface provided by Idris
-- Interface can be given implementations for specific types

quadruple : Num a => a -> a
quadruple x = double ( double x )

-- if we had a Shape type and a function `rotate` that rotates 
-- a shape 90 degrees
-- rotate : Shape -> Shape
-- 
-- you could define a `turn_around` function that rotates a shape 180
-- turn_around : Shape -> Shape
-- turn_around x = rotate ( rotate x )

-- This follows the same pattern as quadruple
-- 2.4 HOF shows how to handle with this pattern with higher order functions


