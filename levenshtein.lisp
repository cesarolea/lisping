(defun recursive-levenshtein-distance (pattern input) 
  "Calculate the Levenshtein distance between two strings using a naive recursive
approach. Do not use!"
  (let (
        (pattern-length (length pattern))
        (input-length (length input))
        (cost 0))
    (when (= pattern-length 0) (return-from recursive-levenshtein-distance input-length))
    (when (= input-length 0) (return-from recursive-levenshtein-distance pattern-length))
    (setf cost (if (char=
                        (char pattern (1- pattern-length))
                        (char input (1- input-length))) 
                   1 0))
    (min 
     (1+ (recursive-levenshtein-distance 
          (subseq pattern 0 (1- pattern-length)) input)) 
     (1+ (recursive-levenshtein-distance 
          pattern (subseq input 0 (1- input-length))))
     (+ (recursive-levenshtein-distance
         (subseq pattern 0 (1- pattern-length))
         (subseq input 0 (1- input-length)))
        cost))))
