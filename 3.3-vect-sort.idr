import Data.Vect

-- using the Ord elem constraint on the function so that we know
-- that we can compare our list elements to sort them
insert : Ord elem =>
        (x : elem) -> (xsSorted : Vect len elem) -> Vect (S len) elem
insert x [] = [ x ]
insert x ( y :: xs ) = case x < y of
                            False => y :: insert x xs
                            True => x :: y :: xs

-- This type defines that the input and output
-- must be the same length & type
insSort : Ord elem => Vect n elem -> Vect n elem
insSort [] = []
insSort ( x :: xs ) = let xsSorted = insSort xs in
                          insert x xsSorted

my_length : List a -> Nat
my_length [] = Z
my_length ( x :: xs ) = ( S ( my_length xs ) )

my_length' : List a -> Nat
my_length' xs = foldr (\x => \n => S n) Z xs

{-
my_length [1,2] = foldr (\x => \n => S n) Z [1,2]
1. (\x => \n => S n) 1 Z ==> S Z
2. (\x => \n => S n) 2 (S Z) ==> S (S Z)
3. ==> S (S Z)
-}

my_reverse : List a -> List a
my_reverse [] = []
my_reverse ( x :: xs ) = my_reverse xs ++ [x]

my_map : ( a -> b ) -> List a -> List b
my_map f [] = []
my_map f ( x :: xs ) = let y = ( f x ) in
                           y :: my_map f xs

my_map_vect : ( a -> b ) -> Vect n a -> Vect n b
my_map_vect f [] = []
my_map_vect f ( x :: xs ) = f x :: my_map_vect f xs
