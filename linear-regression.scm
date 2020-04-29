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
;; load with chicken-iup:
;; (load "R:/Work/git/ML-bao/linear-regression.scm")

;; y = x + 5
(define x (vector 1 2 3 4 5 6 7 8 9 10))
(define y (vector 6 7 8 9 10 11 12 13 14 15))

(if (equal? (vector-length x) (vector-length y))
     (define N (vector-length x)) ;; N is input vector size
          (error "input vectors must be of the same size!"))
          
(define (cdr-vec vec) (list->vector(cdr (vector->list vec))))

(define (flat list)
          (if (equal? (length list) 0)
               0
                    (+ (car list) (flat (cdr list)))))
(define (flat-v vec)
          (if (equal? (vector-length vec) 0)
               0
                    (+ (vector-ref vec 0) (flat-v (cdr-vec vec)))))
                    
(define (flat-square list)
          (if (equal? (length list) 0)
               0
                    (+ (* (car list) (car list)) (flat-square (cdr list)))))
(define (flat-square-v vec)
          (if (equal? (vector-length vec) 0)
               0
                    (+ (* (vector-ref vec 0) (vector-ref vec 0)) (flat-square-v (cdr-vec vec)))))
                    
(define (flat-product list1 list2)
          (if (equal? (length list1) 0)
               0
                    (+ (* (car list1) (car list2)) (flat-product (cdr list1) (cdr list2)))))
(define (flat-product-v v1 v2)
          (if (equal? (vector-length v1) 0)
               0
                    (+ (* (vector-ref v1 0) (vector-ref v2 0)) (flat-product-v (cdr-vec v1) (cdr-vec v2)))))

(define (a x y) ( / ( - (* (flat-v y) ( flat-square-v x)) (* (flat-v x) (flat-product-v x y))) ( - (* N ( flat-square-v x)) (* (flat-v x) (flat-v x))))) ;; y-intercept
(define (b x y) ( / ( - (* N (flat-product-v x y)) (* (flat-v x) (flat-v y))) ( - (* N  (flat-square-v x)) (* (flat-v x) (flat-v x))))) ;; slope

(define x-explanatory 10)
(define y-dependent (+ (a x y) (* x-explanatory (b x y))))

(define (correlation-pearson x y) ( / (- (* N (flat-product x y)) (* (flat x) (flat y))) (sqrt (* (- (* N (flat-square x)) (* (flat x) (flat x))) (- (* N (flat-square y)) (* (flat y) (flat y)))))) )
(define (correlation-pearson-v x y) ( / (- (* N (flat-product-v x y)) (* (flat-v x) (flat-v y))) (sqrt (* (- (* N (flat-square-v x)) (* (flat-v x) (flat-v x))) (- (* N (flat-square-v y)) (* (flat-v y) (flat-v y)))))) )

(display "with x = ") (display x-explanatory) (display " >> ") (display y-dependent) (newline)

(define (predict new-x train-x train-y) (+ (a train-x train-y) (* new-x (b train-x train-y))))
;;(define (byebye) (begin (display "Press any key to terminate...") (newline) (define byebye (read)))
