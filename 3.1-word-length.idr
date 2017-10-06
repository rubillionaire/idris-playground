allLengths : List String -> List Nat
allLengths [] = []
allLengths ( word :: words ) = length word :: allLengths words

xor : Bool -> Bool -> Bool
xor False y = y
xor True y = not y

-- isEven: recursive definition
-- isEven : Nat -> Bool
-- isEven Z = True
-- isEven (S k) = not ( isEven k )

-- isEven: defined mutually with isOdd
mutual
  isEven : Nat -> Bool
  isEven Z = True
  isEven (S k) = isOdd k

  isOdd : Nat -> Bool
  isOdd Z = False
  isOdd ( S k ) = isEven k

-- 5 = (S (S (S (S ( S Z )))))
