(load "../assert.scm")

(define (inc x) (+ x 1))
(define (double f)
  (lambda (x) (f (f x))))

(assert-equal 21 (((double (double double)) inc) 5))
