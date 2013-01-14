(load "../assert.scm")
(load "../1.2/common.scm")

(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (filtered-term x)
    (if (predicate x)
        (term x)
        null-value))
  (if (> a b)
      null-value
      (combiner (filtered-accumulate combiner null-value term (next a) next b predicate)
                (filtered-term a))))

(define (sum term a next b predicate)
  (define (sum-combiner x y)
    (+ x y))
  (filtered-accumulate sum-combiner 0 term a next b predicate))

(define (product term a next b predicate)
  (define (product-combiner x y)
    (* x y))
  (filtered-accumulate product-combiner 1 term a next b predicate))


(define (sum-prime-square a b)
  (define (inc x) (+ x 1))
  (sum square a inc b prime?))

(define (product-prime n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (define (prime-with-n x)
    (= (gcd x n) 1))
  (product identity 1 inc n prime-with-n))

(assert-equal 4 (sum-prime-square 2 2))
(assert-equal 13 (sum-prime-square 2 3))
(assert-equal 38 (sum-prime-square 2 5))
(assert-equal 87 (sum-prime-square 2 8))
(assert-equal 2 (product-prime 3))
(assert-equal 3 (product-prime 4))
(assert-equal 24 (product-prime 5))
(assert-equal 5 (product-prime 6))
(assert-equal 105 (product-prime 8))

