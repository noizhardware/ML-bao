(define lit (list 0 0 5 0 5 5 0 5 0 0 0 0 0 0 0 0 1 0 10 10 0 0 0 0 0 5 5 0 5 5 0 0 0 0 0 0 0 0 0 0 0 0 6 0 0 0 2 0 0 0 2 0 0 0 0 0 0 0 0 0 0 7 10 0 0 0 0 0 0 10 0 10 1 0 0 0 0 3 0 10 0 0 1 0 2 0 0 0 0 0))

(define szc (list 0 10 10 10 10 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 10 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 10 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 10 10 10 10 10 0 0 0 0 0 0 0 0 0))

(display "lit-szc Pearson's correlation: ") (display (correlation-pearson szc lit)) (newline)