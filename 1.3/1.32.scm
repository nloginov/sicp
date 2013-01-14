(load "../assert.scm")

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (accumulate combiner null-value term (next a) next b)
                (term a))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (define (sum-combiner x y)
    (+ x y))
  (accumulate-iter sum-combiner 0 term a next b))

(define (product term a next b)
  (define (product-combiner x y)
    (* x y))
  (accumulate product-combiner 1 term a next b))

;just for test
(define (inc a) (+ a 1))
(define (identity x) x)
(define (cube x) (* x x x))

(define (factorial n)
  (product identity 1 inc n)) 
(define (sum-integers a b)
  (sum identity a inc b))
(define (sum-cubes a b)
  (sum cube a inc b))

(assert-equal 120 (factorial 5))
(assert-equal 3628800 (factorial 10))
(assert-equal 55 (sum-integers 1 10))
(assert-equal 3025 (sum-cubes 1 10))
