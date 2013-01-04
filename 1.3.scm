(load "assert.scm")

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (func x y z)
  (sum-of-squares (max x y z) (max (min x y) (min y z) (min x z))))
  
(define (func1 x y z)
    (if (> x y) 
        (sum-of-squares x (if (> y z) y z))
        (sum-of-squares y (if (> x z) x z))))

(define (func2 x y z)
    (if (> x y) 
        (sum-of-squares x (max y z))
        (sum-of-squares y (max x z))))


(assert-equal 13 (func 1 2 3))
(assert-equal 13 (func 1 3 2))
(assert-equal 13 (func 2 1 3))
(assert-equal 13 (func 2 3 1))
(assert-equal 13 (func 3 1 2))
(assert-equal 13 (func 3 2 1))

(assert-equal 18 (func 3 3 1))
(assert-equal 18 (func 3 1 3))
(assert-equal 18 (func 1 3 3))

(assert-equal 18 (func 3 3 3))

;func1
(assert-equal 13 (func1 1 2 3))
(assert-equal 13 (func1 1 3 2))
(assert-equal 13 (func1 2 1 3))
(assert-equal 13 (func1 2 3 1))
(assert-equal 13 (func1 3 1 2))
(assert-equal 13 (func1 3 2 1))

(assert-equal 18 (func1 3 3 1))
(assert-equal 18 (func1 3 1 3))
(assert-equal 18 (func1 1 3 3))

(assert-equal 18 (func1 3 3 3))

;func2
(assert-equal 13 (func2 1 2 3))
(assert-equal 13 (func2 1 3 2))
(assert-equal 13 (func2 2 1 3))
(assert-equal 13 (func2 2 3 1))
(assert-equal 13 (func2 3 1 2))
(assert-equal 13 (func2 3 2 1))
                      
(assert-equal 18 (func2 3 3 1))
(assert-equal 18 (func2 3 1 3))
(assert-equal 18 (func2 1 3 3))
                      
(assert-equal 18 (func2 3 3 3))

