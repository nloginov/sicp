(define (assert-equal expected actual)
  (if (= expected actual)
    (display "Test passed.\n")
    (display-failed expected actual)))

(define (assert-equal-cons expected actual)
  (if (and (= (car expected) (car actual))
           (= (cdr expected) (cdr actual)))
    (display "Test passed.\n")
    (display-failed expected actual)))

(define (display-failed expected actual)
  (display "Test failed. Expected: ")
  (display expected)
  (display ". But was: ")
  (display actual)
  (newline))

(define (assert-false predicate)
  (if (not predicate)
    (display "Test passed.\n")
    (display "Test failed.\n")
    ))

(define (assert-true predicate)
  (if predicate
    (display "Test passed.\n")
    (display "Test failed.\n")
    ))

(define (assert-close expected actual)
  (if (< (abs (- expected actual)) 0.0001)
    (display "Test passed.\n")
    (display "Test failed.\n")
    ))

