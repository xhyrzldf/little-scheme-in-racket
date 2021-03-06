;; 原子数字的定义
(define (atom? x)
    (and (not (pair? x)) (not (null? x))))

;; 试试
(atom? (quote ()))

;; 1. car 仅作用于非空列表

(car '(((hotdogs)) (and)))
;; -> '((hotdogs))
;;2. cdr 仅作用域非空列表,任意非空列表的cdr总是另一个列表

;;3. (cons a b) 将a加入到b的表头 a是任意的s-表达式 b是一个列表 结果是一个列表

(cons '(ab (C)) '())
;; -> '((ab (C)))

;;4. null? 仅仅针对列表,判断该列表是否为一个空列表
;;5. (eq? a b)  a b 都必须是一个非数字的原子


;;总结 一些基本的函数与规则
;; 1. (car lat)   仅作用于非空列表
;; 2. (cdr lat)   仅作用域非空列表,任意非空列表的cdr总是另一个列表
;; 3. (cons a b)  将a加入到b的表头,a是任意的s-表达式,b是一个列表,结果是一个列表
;; 4. (null? lat) 仅仅针对列表,判断该列表是否为一个空列表
;; 5. (eq? a b)   a b都必须是一个非数字的原子



