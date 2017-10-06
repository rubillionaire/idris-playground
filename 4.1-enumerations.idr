data Direction = North | East | South | West

turnClockwise : Direction -> Direction
turnClockwise North = East
turnClockwise East = South
turnClockwise South = West
turnClockwise West = North

-- data Shape = Triangle | Rectangle | Circle
||| Represents shapes.
data Shape = ||| A triangle, defined by a base and height.
             Triangle Double Double
           | ||| A rectangle, defined by its length and height.
             Rectangle Double Double
           | ||| A circle, defined by its radius.
             Circle Double

area : Shape -> Double
area (Triangle base height) = 0.5 * base * height
area (Rectangle length height) = length * height
area (Circle radius) = pi * radius * radius

{-
Verbose method of definig the Shape data type:
data Shape : Type where
     Triangle : Double -> Double -> Shape
     Rectangle : Double -> Double -> Shape
     Circle : Double -> Shape
-}

-- recursive types. they can be defined in terms of themselves.
-- as long as they have a terminating value
-- data Nat = Z | S Nat

data Picture = Primitive Shape
             | Combine Picture Picture
             | Rotate Double Picture
             | Translate Double Double Picture

rectangle : Picture
rectangle = Primitive ( Rectangle 20 10 )

circle : Picture
circle = Primitive ( Circle 5 )

triangle : Picture
triangle = Primitive ( Triangle 10 10 )

testPicture : Picture
testPicture = Combine ( Translate 5 5 rectangle )
              ( Combine ( Translate 35 5 circle )
              ( Translate 15 25 triangle ) )
