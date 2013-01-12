(load "../assert.scm")
(load "common.scm")
;Shit solution. Don't look on this.

(define (modified-remainder t m)
  (if (and (not (= t 1))
           (not (= t (- m 1)))
           (= (remainder (square t) m) 1))
      0
      (remainder (square t) m)))

(define (modified-expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (modified-remainder (modified-expmod base (/ exp 2) m) m))
        (else 
          (remainder (* base (modified-expmod base (- exp 1) m)) m))))

(define (mr-test n a)
  (= (modified-expmod a (- n 1) n) 1))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((mr-test n times) (fast-prime? n (- times 1)))
        (else #f)))

(define (mr-prime? n)
  (fast-prime? n (- n 1)))

(assert-true (mr-prime? 3))
(assert-true (mr-prime? 5))
(assert-true (mr-prime? 7))
(assert-true (mr-prime? 149))
(assert-true (mr-prime? 151))
(assert-true (mr-prime? 157))

(assert-false (mr-prime? 561))
(assert-false (prime? 561))
(assert-false (mr-prime? 1105))
(assert-false (prime? 1105))
(assert-false (mr-prime? 1729))
(assert-false (prime? 1729))
(assert-false (mr-prime? 2465))
(assert-false (prime? 2465))
(assert-false (mr-prime? 2821))
(assert-false (prime? 2821))
(assert-false (mr-prime? 6601))
(assert-false (prime? 6601))
