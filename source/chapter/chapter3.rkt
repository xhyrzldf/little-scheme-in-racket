;; 用cons构筑恢宏

;; rember函数定义 将一个原子a和一个列表lat作为参数,生成一个新列表,新列表为剔除了首个a的lat
;; 第一版定义
(define (rember a lat)
    (cond 
        ((null? lat) (quote ()))
        (else (cond 
            ((eq? (car lat) a) (cdr lat))
            (else (rember a (cdr lat)))))))

