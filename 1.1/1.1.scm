(load "../assert.scm")

(assert-equal 10 10)
(assert-equal 8 (- 9 1))
(assert-equal 3 (/ 6 2))
(assert-equal 6 (+ (* 2 4) (- 4 6)))

(define a 3)
(define b (+ a 1))

(assert-equal 19 (+ a b (* a b)))
(assert-false (= a b))
(assert-equal a (if (and (> b a) (< b (* a b)))
					a
					b))

(assert-equal 16 (cond ((= a 4) 6)
					   ((= b 4) (+ 6 7 a))
                       (else 25)))

(assert-equal 6 (+ 2 (if (> b a) b a)))
(assert-equal 16 (* (cond ((> a b) a)
                          ((< a b) b)
                          (else -1))
                    (+ a 1)))

