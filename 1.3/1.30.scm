(load "../assert.scm")

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a ) (+ (term a) result))))
  (iter a 0))

;Just for test
(define (identity x) x)
(define (cube x) (* x x x))
(define (inc x) (+ x 1))

(define (sum-integers a b)
  (sum identity a inc b))
(define (sum-cubes a b)
  (sum cube a inc b))

(assert-equal 55 (sum-integers 1 10))
(assert-equal 3025 (sum-cubes 1 10))
