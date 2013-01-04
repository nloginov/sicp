(define (assert-equal expected actual)
  (if (= expected actual)
    (display "Test pass\n")
    (display "Test failed\n")
  ))

(define (assert-false predicate)
	(if (not predicate)
		(display "Test pass\n")
		(display "Test failed\n")
	))

(define (assert-close expected actual)
  (if (< (abs (- expected actual)) 0.0001)
    (display "Test pass\n")
    (display "Test failed\n")
  ))

