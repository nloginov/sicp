(load "../assert.scm")
(load "common.scm")

(assert-equal 199 (smallest-divisor 199))
(assert-equal 1999 (smallest-divisor 1999))
(assert-equal 7 (smallest-divisor 19999))
