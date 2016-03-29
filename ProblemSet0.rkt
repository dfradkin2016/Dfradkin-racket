;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ProblemSet0) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; Function 0: Convert a temperature from farenheit to celcius

;; to-celcius : number -> number

;; Input: a number, temperature

;; Output: temperature, converted to celcius 

;; Test cases for to-celcius

( define ( to-celcius n) ( / (* (- n 32) 5) 9 ) )

(check-expect (to-celcius 32) 0)
(check-expect (to-celcius 86) 30)
(check-expect (to-celcius 5) -15)

;;Function 1: Determine if a given year is a leap year (refer to this).

;; is-leap-year : number -> boolean

;; Input: a non-negative number, year

;; Output: boolean value representing whether year is a leap year

;;( define ( is-leap-year n)
;;   (if (equal? (modulo n 4) 0)
;;       (if (equal? (modulo n 100) 0)
;;           (if (equal? (modulo n 400) 0)
;;               #t
;;               #f)
;;           #t)
;;       #f)
;;)

( define ( is-leap-year n) (cond
                             [ (and (equal? (modulo n 4) 0) (equal? (modulo n 400) 0) ) #t ]
                             [ (and (equal? (modulo n 4) 0) (not (equal? (modulo n 100) 0) )  ) #t ]
                             [ else #f ] ) )

;; Test cases for is-leap-year 
(check-expect (is-leap-year 2016) true)
(check-expect (is-leap-year 2000) true)
(check-expect (is-leap-year 2015) false)
(check-expect (is-leap-year 1900) false)
(check-expect (is-leap-year 1700) false)

;; Function 2: Output a string to represent a countdown from some value

;; countdown : number -> String

;; Input: a non-negative number, n

;; Output: string value that counts down from n to 0, where 0 is represented ;; by Blastoff!

(define (countdown num)
  (cond
    [ (<= num 0) "Blastoff!"]
    [else (string-append (number->string num)  " " (countdown(- num 1)))]))

;; Test cases for countdown
(check-expect (countdown 10) "10 9 8 7 6 5 4 3 2 1 Blastoff!")
(check-expect (countdown 2) "2 1 Blastoff!")
(check-expect (countdown 0) "Blastoff!")
(check-expect (countdown -3) "Blastoff!")
;;***HINTS*** You have access to the following functions:

;;number->string n ;Turns n into a string
;;string-append word1, word2, ... ;appends all strings into 1 string


;;Function 3: Num digits
(define (num-digits num)
  (cond
    [ (< num 10) 1]
    [else (+ 1 (num-digits (quotient num 10)))]))

;; Test cases for num-digits
(check-expect (num-digits 8839348) 7)
(check-expect (num-digits 0) 1)
(check-expect (num-digits 88393480) 8)
(check-expect (num-digits 88) 2)
(check-expect (num-digits 100) 3)

;;Function 4: Summation
(define (summation num)
  (cond
    [ (= num 0) 0]
    [else (+ num (summation (- num 1)))]))

(check-expect (summation 1) 1)
(check-expect (summation 2) 3)
(check-expect (summation 3) 6)
(check-expect (summation 4) 10)

;;learning what cons does
(cons 3 empty)
(cons 4 (cons 3 empty))
(cons 6 (cons 4 (cons 3 empty)))


;;Function 5: Create list
;; Create a list of numbers of
;; length size
;; example (create_list 8) should return (8 7 6 5 4 3 2 1)

(define (create-list num)
  (cond
    [ (< num 1) empty]
    [ else (cons num (create-list (- num 1)))]))

;;(create-list 8)
(check-expect (create-list 8) (cons 8 (cons 7 (cons 6 (cons 5 (cons 4 (cons 3 (cons 2 (cons 1 '())))))))))
