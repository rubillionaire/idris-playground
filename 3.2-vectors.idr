import Data.Vect

fourInts : Vect 4 Int
fourInts = [ 0, 1, 2, 3  ]

sixInts : Vect 6 Int
sixInts = [ 4, 5, 6, 7, 8, 9 ]

tenInts : Vect 10 Int
tenInts = fourInts ++ sixInts

-- *3.2-vectors> the (Vect _ _) ["oh", "hai"]
-- ["oh", "hai"] : Vect 2 String
-- underscores can be used to infer types of a value

-- Defining allLengths in terms of a Vect exposes the relationship
-- between the input and output values more clearly
-- this also removes the possibility for the input and output
-- to have different lengths! thanks, type checker
allLengths : Vect len String -> Vect len Nat
allLengths [] = []
allLengths ( word :: words ) = length word :: allLengths words

-- enforce totality of a function by prefxing the definition with total
-- in the case of `allLengths`
-- total allLengths : Vect len String -> Vect len Nat
