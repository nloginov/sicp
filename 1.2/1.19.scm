(load "../assert.scm")

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q) (* p p))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))


(assert-equal 0 (fib 0))
(assert-equal 1 (fib 1))
(assert-equal 1 (fib 2))
(assert-equal 2 (fib 3))
(assert-equal 3 (fib 4))
(assert-equal 55 (fib 10))
(assert-equal 39088169 (fib 38))

