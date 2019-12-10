;; equations from https://www.statisticshowto.datasciencecentral.com/probability-and-statistics/regression-analysis/find-a-linear-regression-equation/
;; x = explanatory variable
;; y = dependent variable
;; y = a + b * x
;; a = y-intercept
;; b = slope
;; a = (SUM(y) * SUM(x * x) - SUM(x) * SUM( x + y)) / (n * SUM(x * x) - SUM(x) * SUM(x))
;; b = n .... blah blah, see code below...

;; y = x * 2
; (define x (list 1 2 3 4 5 6 7 8 9 10))
; (define y (list 2 4 6 8 10 12 14 16 18 20))

;; compile to executable with Chicken:
;; csc "R:/Work/git/ML-bao/linear-regression.scm"

;; y = x + 5
(define x (list 1 2 3 4 5 6 7 8 9 10))
(define y (list 6 7 8 9 10 11 12 13 14 15))

(if (equal? (length x) (length y))
     (define N (length x)) ;; N is input vector size
          (error "input vectors must be of the same size!"))

(define (flat list)
          (if (equal? (length list) 0)
               0
                    (+ (car list) (flat (cdr list)))))
                    
(define (flat-square list)
          (if (equal? (length list) 0)
               0
                    (+ (* (car list) (car list)) (flat-square (cdr list)))))
                    
(define (flat-product list1 list2)
          (if (equal? (length list1) 0)
               0
                    (+ (* (car list1) (car list2)) (flat-product (cdr list1) (cdr list2)))))

(define a ( / ( - (* (flat y) ( flat-square x)) (* (flat x) (flat-product x y))) ( - (* N ( flat-square x)) (* (flat x) (flat x))))) ;; y-intercept
(define b ( / ( - (* N (flat-product x y)) (* (flat x) (flat y))) ( - (* N  (flat-square x)) (* (flat x) (flat x))))) ;; slope

(define x-explanatory 10)
(define y-dependent (+ a (* x-explanatory b)))

(define (correlation-pearson x y) ( / (- (* N (flat-product x y)) (* (flat x) (flat y))) (sqrt (* (- (* N (flat-square x)) (* (flat x) (flat x))) (- (* N (flat-square y)) (* (flat y) (flat y)))))) )

(display "with x = ") (display x-explanatory) (display " >> ") (display y-dependent) (newline)

(define (predict x) (+ a (* x b)))
;;(define (byebye) (begin (display "Press any key to terminate...") (newline) (define byebye (read)))
