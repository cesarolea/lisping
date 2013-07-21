(defun anagram-of-palindrome (word)
  "Return T if word is an anagram of a palindrome. Nil otherwise."
  (let (
        (pairs 0)
        (char-dictionary (make-hash-table)))
    (loop for current-char across word do
         (if (nth-value 1 (gethash current-char char-dictionary))
              (progn
                (setf (gethash current-char char-dictionary) (1+ (gethash current-char char-dictionary)))
                (when (= (mod (gethash current-char char-dictionary) 2) 0)
                  (setf pairs (1+ pairs))))
              (setf (gethash current-char char-dictionary) 1))
         )
    (when (= pairs (floor (/ (length word) 2))) T)))
