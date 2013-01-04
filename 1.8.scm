(load "assert.scm")

(define (cube-root-iter prev_guess cur_guess x)
    (if (good-enough? prev_guess cur_guess)
        cur_guess
        (cube-root-iter cur_guess (make-iteration x cur_guess) x)))
        
(define (good-enough? prev cur)
    (< (abs (- prev cur)) 0.00001))

(define (make-iteration x y)
    (/ (+ (/ x (* y y))(* 2 y)) 3))

(define (cube-root x)
    (cube-root-iter 0.0 1.0 x))
    
    
(assert-close 1. (cube-root 1.))
(assert-close 2. (cube-root 8.))
(assert-close 3. (cube-root 27.))
(assert-close 1.7099759466766968 (cube-root 5.))
(assert-close 0. (cube-root 0.))
(assert-close -1. (cube-root -1.))
(assert-close -2. (cube-root -8.))
(assert-close -3. (cube-root -27.))
(assert-close -1.7099759466766968 (cube-root -5.))
