double : Int -> Int
double x = x + x

add : Int -> Int -> Int
add x y = x + y

identityInt : Int -> Int
identityInt x = x

identityString : String -> String
identityString x = x

identity : ty -> ty
identity x = x

-- an example of using the generic `ty` as a variable is in the
-- definition of `the`
-- defined in the Prelude as
-- the : ( ty: Type ) -> ty -> ty
-- the ty x = x
