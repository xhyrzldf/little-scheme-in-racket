;; 第二章 处理，处理，反复处理...

;; 原子数字的定义
(define (atom? x)
    (and (not (pair? x)) (not (null? x))))

;; lat 函数定义 用于判断一个列表里的所有元素是否都为原子atom
(define (lat? l)
    (cond ;;cond 如果predicate为false 询问下个问题
        ((null? l) #t)  ;;1.询问 参数l是否为空列表
        ((atom? (car l)) (lat? (cdr l))) ;;1.询问 参数(car l) 是否为原子
        (else #f))) ;;最后的问题直接 返回#f (else的值为#t)

;; 测试
(lat? '(a c d f))
(lat? '(jack rose (yoda luke)))


