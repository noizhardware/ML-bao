(define N 244)

(define (flat list)
          (if (equal? (length list) 0)
               0
                    (+ (car list) (flat (cdr list)))))
                    
(define (flat-square list)
          (if (equal? (length list) 0)
               0
                    (+ (* (car list) (car list)) (flat-square (cdr list)))))
                    
(define (flat-product list1 list2) ;; both lists must be of same length TODO: add a check for that
          (if (equal? (length list1) 0)
               0
                    (+ (* (car list1) (car list2)) (flat-product (cdr list1) (cdr list2)))))

; SumXY = flatProduct(x,y);
; SumX = flat (x);
; SumY = flat (y);
; SumSquareX = flatSq(x);
; 
; b1 = (SumXY - ((SumX * SumY) / N)) / (SumSquareX);
; b0 = (SumY - (b1 * SumX)) / N;
; 
; printf ("y = %f * x + %f\n", b1, b0);

