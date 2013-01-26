(load "../assert.scm")

(define (make-rat n d) 
  (cond ((< d 0) (cons (- n) (- d)))
        (else (cons n d))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))


(assert-equal-cons (cons 1 2) (make-rat 1 2))
(assert-equal-cons (cons -1 2) (make-rat -1 2))
(assert-equal-cons (cons 1 2) (make-rat -1 -2))
(assert-equal-cons (cons -1 2) (make-rat 1 -2))

(assert-equal-cons (cons -1 4) (mul-rat (make-rat 1 -2) 
                                        (make-rat -1 -2)))
