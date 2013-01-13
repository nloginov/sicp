(load "../assert.scm")

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (integrate-simpson f a b n)
  (integrate-with-step f a b (/ (- b a) n)))

(define (integrate-with-step f a b h)
  (define (even-term x)
    (* 2 (f x)))
  (define (odd-term x)
    (* 4 (f x)))
  (define (next a)
    (+ a (* 2 h)))
  (* (/ h 3. ) 
     (+ (sum odd-term (+ a h) next (- b h))
        (sum even-term (+ a (* 2 h)) next (- b h))
        (f a)
        (f b))))

; Just for comparison
(define (cube x)
  (* x x x))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(assert-true (< (abs (- (integrate-simpson cube 0 1 100) 
                        0.25))
                (abs (- (integral cube 0 1 (/ 1. 100)) 
                        0.25))))

(assert-true (< (abs (- (integrate-simpson cube 0 1 1000) 
                        0.25))
                (abs (- (integral cube 0 1 (/ 1. 1000)) 
                        0.25))))

