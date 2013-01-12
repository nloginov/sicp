(load "common.scm")

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else 
          (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (search-for-primes from primes-number)
   (if (> primes-number 0)
      (if (timed-prime-test from)
          (search-for-primes (+ from 2) (- primes-number 1))
          (search-for-primes (+ from 2) primes-number))))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 5)
      (report-prime n (- (runtime) start-time))
      #F))

(search-for-primes 1000001 3)
(search-for-primes 10000001 3)
(search-for-primes 100000001 3)
(search-for-primes 1000000001 3)


;1000003 *** .0011539459228515625
;1000033 *** 9.322166442871094e-4
;1000037 *** 9.610652923583984e-4
;10000019 *** .0010061264038085938
;10000079 *** .0010559558868408203
;10000103 *** .0020329952239990234
;100000007 *** .0013020038604736328
;100000037 *** .0011930465698242188
;100000039 *** .0013489723205566406
;1000000007 *** .0013141632080078125
;1000000009 *** .0014069080352783203
;1000000021 *** .0013279914855957031
