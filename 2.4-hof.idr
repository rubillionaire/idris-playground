twice : ( a -> a ) -> a -> a
twice f x = f ( f x )

-- type delcations with no definitions
Shape : Type
rotate : Shape -> Shape

double : Num ty => ty -> ty
double x = x + x

quadruple : Num a => a -> a
quadruple = twice double

turn_around : Shape -> Shape
turn_around = twice rotate

add : Int -> Int -> Int
add x y = x + y
