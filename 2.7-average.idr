module Average

export
average : String -> Double
average str = let numWords = wordCount str
                  totalLength = sum ( allLengths ( words str ) ) in
                  cast totalLength / cast numWords
  where
    wordCount : String -> Nat
    wordCount str

