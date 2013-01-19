(load "../assert.scm")

(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(assert-equal 49 ((compose square inc) 6))
