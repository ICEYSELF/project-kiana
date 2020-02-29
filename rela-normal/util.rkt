#lang racket

(provide unimplemented
         distance
         unused
         id
         display-n-ret
         displayln-n-ret
         and-proc
         or-proc
         not-null?
         less?
         greater?
         less-or-eq?
         greater-or-eq?
         map-recur
         to-be-or-not-to-be)

; unimplemented stuffs and todos
(define (unimplemented) (error "unimplemented"))

; distance function
(define (distance x y) (abs (- x y)))

; for marking unused parameters
(define (unused x . xs) (void))

; sometimes useful for debugging
(define (id x) x)

(define (display-n-ret x)
  (display x)
  x)

(define (displayln-n-ret x)
  (displayln x)
  x)

; procedure version of builtin special form `and`/`or`, does NOT have short circuit eval!
(define (and-proc x y) (and x y))
(define (or-proc x y) (or x y))

; a shorthand
(define (not-null? blah) (not (null? blah)))

; hard-coded comparators, considered nasty, but out data types are limited to numbers and strings
(define (less? x y)
  (cond [(number? x) (< x y)]
        [(string? x) (string<? x y)]))

(define (greater? x y)
  (cond [(number? x) (> x y)]
        [(string? x) (string>? x y)]))

(define (less-or-eq? x y) (or (less? x y) (equal? x y)))

(define (greater-or-eq? x y) (or (greater? x y) (equal? x y)))

; we need this for tree structure traversing
(define (map-recur proc x)
  (define (map-one item)
    (if (list? item) (map map-one item) (proc item)))
  (map map-one x))

(define (to-be-or-not-to-be x) 
  (if (false? x)
      false
      true))