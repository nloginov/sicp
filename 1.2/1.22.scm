(load "../assert.scm")
(load "common.scm")

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #F))

(define (search-for-primes from primes-number)
   (if (> primes-number 0)
      (if (timed-prime-test from)
          (search-for-primes (+ from 2) (- primes-number 1))
          (search-for-primes (+ from 2) primes-number))))

(search-for-primes 1000001 3)
(search-for-primes 10000001 3)
(search-for-primes 100000001 3)
(search-for-primes 1000000001 3)

;1000003 *** .005755901336669922
;1000033 *** .005553007125854492
;1000037 *** .005796194076538086
;10000019 *** .017962932586669922
;10000079 *** .01778888702392578
;10000103 *** .017837047576904297
;100000007 *** .05588412284851074
;100000037 *** .054594993591308594
;100000039 *** .05636000633239746
;1000000007 *** .17532801628112793
;1000000009 *** .1769869327545166
;1000000021 *** .17118310928344727

