holes
parts of the program yet to be written

types as first class language constructs

types as a plan for the program

allows for relationships to be expressed between values
for example, two lists have the same length

assumptions can be checked at run time. is the list supposed to have a value? that can be determined before the program is run

a program can be formally stated and proven correct. if desired

define types first
for functions
write the input and output types
define the function using the structure of the input types to guide implementation
refine and edit the type and funtion definition as necessary

simple type
AnyList
a list of any value

generic type
a list of strings, for example

dependent type
specify the size of the input and output list
list of 3 strings appended to a list of 4 strings results in a list of 7 strings


           |  input          |  input         |  Output Type
-------------------------------------------------------------
simple     |  AnyList        |  AnyList       |  AnyList
generic    |  List String    |  List String   |  List String
dependent  |  Vect 4 String  |  Vec 3 String  |  Vec 7 String


List & Vect are valid idris. AnyList is for illustration

`List elem` is also valid, where `elem` is a type variable
`Vect n elem` is a list of `elem` of `n` length

simple     |  AnyList
generic    |  List elem
dependent  |  Vect n elem

function with inputs `Vect n elem` & `Vect m elem` might have Output type `Vect (n + m) elem`

in general
concrete type names begin with an upper case letter
typer variable names begin with a lower case letter

pure functions have a property known as referential transparency

'' = char
"" = string

:t variable
to check a type

?variable
to create a hole that helps point out what type is expected to satisfy the partial function implementation


```
*2.3-generic> :t (+)
(+) : Num ty => ty -> ty -> ty
*2.3-generic> :t (==)
(==) : Eq ty => ty -> ty -> Bool
*2.3-generic> :t (<=)
(<=) : Ord ty => ty -> ty -> Bool
```

`Eq` is an interface that states the type must support quality ( == & /= )
`Ord` states that the type must support the comparison of operators <, <=, >, >=

Using `()` around infix operators allows you to use them as functions within the repl

```
*2.3-generic> :let addTwo = (+) 2
*2.3-generic> addTwo( 4 )
6 : Integer
*2.3-generic> :t (< 3)
\ARG => ARG < 3 : Integer -> Bool
*2.3-generic> :let lessThanThree = (< 3)
*2.3-generic> lessThanThree( 1 )
True : Bool
*2.3-generic> lessThanThree( 4 )
```

curry & uncurry function
function that takes a 