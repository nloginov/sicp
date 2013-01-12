(load "../assert.scm")

(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))
	
(assert-equal 5 (a-plus-abs-b 2 3))
(assert-equal 5 (a-plus-abs-b 2 -3))
(assert-equal 1 (a-plus-abs-b -2 -3))
(assert-equal 1 (a-plus-abs-b -2 -3))
