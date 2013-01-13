(load "../assert.scm")

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a ) (* (term a) result))))
  (iter a 1))

(define (inc a)
  (+ a 1))

(define (calculate-pi n)
  (define (numerator-term x)
    (* 2 (+ (quotient x 2) 1)))

  (define (denominator-term x)
    (+ (* 2 (quotient (+ x 1) 2)) 1))

  (* (/ 
       (product-iter numerator-term 1 inc n)
       (product denominator-term 1 inc n))
     4))

(define (factorial n)
  (define (identity x) x)
  (product identity 1 inc n)) 

(assert-equal 8/3 (calculate-pi 1))
(assert-equal 32/9 (calculate-pi 2))
(assert-equal 128/45 (calculate-pi 3))
(assert-equal 768/225 (calculate-pi 4))
(assert-equal 120 (factorial 5))
(assert-equal 3628800 (factorial 10))
