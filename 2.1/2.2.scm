(load "../assert.scm")

(define (make-point x y) (cons x y))
(define (x-point x) (car x))
(define (y-point y) (cdr y))

(define (make-segment a b) (cons a b))
(define (start-segment x) (car x))
(define (end-segment x) (cdr x))

(define (midpoint-segment x)
  (make-point (/ (+ 
                   (x-point (start-segment x)) 
                   (x-point (end-segment x)))
                 2)
              (/ (+
                   (y-point (start-segment x))
                   (y-point (end-segment x)))
                 2)))

(assert-equal-cons (cons .5 .5) (midpoint-segment (make-segment (make-point 0 0) (make-point 1 1))))
(assert-equal-cons (cons 0 0) (midpoint-segment (make-segment (make-point 0 0) (make-point 0 0))))
(assert-equal-cons (cons 1 1) (midpoint-segment (make-segment (make-point 1 1) (make-point 1 1))))
(assert-equal-cons (cons 0 .5) (midpoint-segment (make-segment (make-point 0 0) (make-point 0 1))))
(assert-equal-cons (cons .5 1) (midpoint-segment (make-segment (make-point 0 1) (make-point 1 1))))
(assert-equal-cons (cons 4 2) (midpoint-segment (make-segment (make-point 2 3) (make-point 6 1))))

