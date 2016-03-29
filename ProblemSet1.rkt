#lang racket

;;Function 5: Create list
;; Create a list of numbers of
;; length size
;; example (create_list 8) should return (8 7 6 5 4 3 2 1)

(define (create-list num)
  (cond
    [ (< num 1) empty]
    [ else (cons num (create-list (- num 1)))]))

(create-list 8)

(empty? empty)
(cons? (cons 3 empty))

;; Function 6: Length
;; number of items in a list
(define (length l)
  (cond
    [ (empty? l) 0]
    [ else (+ 1 (length (rest l)))]))

(length (create-list 8))