(defun recursive-levenshtein-distance (pattern input) 
  "Calculate the Levenshtein distance between two strings using a naive recursive
approach. Do not use!"
  (let (
        (pattern-length (length pattern))
        (input-length (length input))
        (cost 0))
    (if (= pattern-length 0) (return-from recursive-levenshtein-distance input-length))
    (if (= input-length 0) (return-from recursive-levenshtein-distance pattern-length))
    (if (string= 
         (subseq pattern (1- pattern-length) pattern-length) 
         (subseq input (1- input-length) input-length))
        (setf cost 0) 
        (setf cost 1))
    (min 
     (1+ (recursive-levenshtein-distance 
          (subseq pattern 0 (1- pattern-length)) input)) 
     (1+ (recursive-levenshtein-distance 
          pattern (subseq input 0 (1- input-length))))
     (+ (recursive-levenshtein-distance
         (subseq pattern 0 (1- pattern-length))
         (subseq input 0 (1- input-length)))
        cost))))
