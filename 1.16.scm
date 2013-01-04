(load "assert.scm")

(define (fast-expt b n)
  (fast-expt-iter n 1 b))

(define (fast-expt-iter n a d)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (/ n 2) a (* d d)))
        (else (fast-expt-iter (- n 1) (* a d) d))))

(assert-equal 1 (fast-expt 34 0))
(assert-equal 1024 (fast-expt 2 10))
(assert-equal 10000000 (fast-expt 10 7))
(assert-equal 123 (fast-expt 123 1))
(assert-equal 2048 (fast-expt 2 11))
(assert-equal 25 (fast-expt 5 2))
(assert-equal 65536 (fast-expt 2 16))
