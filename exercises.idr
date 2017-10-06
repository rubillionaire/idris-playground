curry : ( f : (a, b) -> c ) -> a -> b -> c

uncurry: ( f : a -> b -> c ) -> ( ( a, b ) -> c )

-- curry ( uncurry ( f ) ) = f
-- uncurry ( curry ( f ) ) = f

-- :t ("A", "B", "C")
val1a : ( String, String, String )
val1a = ("A", "B", "C")

-- :t [ "A", "B", "C" ]
val1b : List String
val1b = [ "A", "B", "C" ]

-- :t (('A', "B"), 'C')
val1c : ( ( Char, String ), Char )
val1c = (('A', "B"), 'C')

palindrome : Nat -> String -> Bool
palindrome n s = ( reverse ( toLower s ) == ( toLower s ) ) && ( length s > n  )

counts : String -> ( Nat, Nat )
counts s = ( length ( words s ), length s )

top_ten : Ord a => List a -> List a
top_ten xs = take 10 ( reverse ( sort xs ) )
-- top_ten = ( List.take 10 ) . reverse . sort

-- over_length 3 [ "one", "two", "three", "four" ] = 2
over_length : Nat -> List String -> Nat
over_length n xs = length ( filter ( > n) ( map length xs ) )

repl_palindrome : IO ()
repl_palindrome = repl "Is it a palindrome?: " processInput
  where
    processInput : String -> String
    processInput s = ( show ( palindrome 0 s ) ) ++ "\n"

repl_counts : IO ()
repl_counts = repl "Enter a string: " processInput
  where
    processInput : String -> String
    processInput s = ( show ( counts s ) ) ++ "\n"
