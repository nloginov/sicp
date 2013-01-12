(load "../assert.scm")
(load "common.scm")

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next divisor)
  (if (= divisor 2)
      3
      (+ 2 divisor)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #F))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes from primes-number)
   (if (> primes-number 0)
      (if (timed-prime-test from)
          (search-for-primes (+ from 2) (- primes-number 1))
          (search-for-primes (+ from 2) primes-number))))


(search-for-primes 1000001 3)
(search-for-primes 10000001 3)
(search-for-primes 100000001 3)
(search-for-primes 1000000001 3)

;1000003 *** .003461122512817383
;1000033 *** .003462076187133789
;1000037 *** .003309011459350586
;10000019 *** .01100015640258789
;10000079 *** .010535001754760742
;10000103 *** .01058197021484375
;100000007 *** .03433489799499512
;100000037 *** .034008026123046875
;100000039 *** .03351092338562012
;1000000007 *** .10808205604553223
;1000000009 *** .10921096801757812
;1000000021 *** .10748505592346191

