;; 快速排序 核心思想 (array < x) + (array = x) + (array > x)
(define (quick-sort array)
    (cond 
        [(empty? array) empty]
        [else (append 
                     (quick-sort (filter (lambda (x) (< x (first array))) array))
                     (filter (lambda (x) (= x (first array))) array)
                     (quick-sort (filter (lambda (x) (> x (first array))) array)))]))

;; 测试

(quick-sort '(1 3 2 5 3 4 5 0 9 82 4))
;; -> '(0 1 2 3 3 4 4 5 5 9 82)