import Data.Vect

{- two dimentional array in idris

Vect 3 ( Vect 4 Int )

same as

[ [ 1,  2,  3,  4 ],
  [ 5,  6,  7,  8 ],
  [ 9, 10, 11, 12 ] ] ]

adding matrices requires two of the same dimensions
type of matrix addition could be:

addMatrix : Num numType =>
            Vect rows ( Vect cols numType ) ->
            Vect rows ( Vect cols numType ) ->
            Vect rows ( Vect cols numType )

matrix multiplication requries
the number of columns in the first matrix equal
the number of rows in the second matrix
n x m * m * p = n x p
thus:

multipyMatrix: Num numType =>
               Vect n ( Vect m numType ) -> Vect m ( Vect p numType  )
               Vect n ( Vect p numType )

-}

createEmpties : Vect n (Vect 0 elem)
createEmpties = replicate _ []

transposeHelper : (x : Vect n elem) -> (xsTrans : Vect n (Vect k elem)) -> Vect n (Vect (S k) elem)
transposeHelper [] [] = []
transposeHelper (x :: ys) (y :: xs) = (x :: y) :: transposeHelper ys xs

transposeMat : Vect m ( Vect n elem ) -> Vect n ( Vect m elem )
transposeMat [] = createEmpties
transposeMat (x :: xs) = let xsTrans = transposeMat xs in
                             transposeHelper x xsTrans

zipTransponseMat : Vect m ( Vect n elem ) -> Vect n ( Vect m elem )
zipTransponseMat [] = createEmpties
-- zipTransponseMat ( x :: xs ) = zipWith zipTransponseMat
-- TODO Page 81 exercise

{-
[ [1, 2],
  [3, 4],
  [5, 6] ]
elem = Int
m = 3
n = 2
x =    [ 1, 2 ]
xs = [ [ 3, 4 ],
       [ 5 ,6 ] ]

f ( Vect n elem -> Vect n ( Vect _ elem ) )


zipWith f ( x :: xs ) ( y :: ys ) = f x y :: zipWith f xs ys

zipWith f x []
where f : ( x : Vect n elem ->  )

transposed:
[ [ 1, 3, 5 ],
  [ 2, 4, 6 ] ]

-}

addMatrix : Num numType =>
            Vect rows ( Vect cols numType ) ->
            Vect rows ( Vect cols numType ) ->
            Vect rows ( Vect cols numType )
-- addMatrix [] [] = []
-- addMatrix (x :: xs) (y :: ys) = x + y :: ?rhs
