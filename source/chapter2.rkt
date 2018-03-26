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
(lat? '(a c d f)) ;; Expect #t
(lat? '(jack rose (yoda luke))) ;;Expect #f

;;十戒 1.在表述任意函数时，总是将询问null?作为诸问题之首(递归的终止条件)

;; member函数定义 用于判断一个列表是否包含某一个原子
(define (member? a lat) 
    (cond 
        ((null? lat) #f) ;;如果lat是空列表 直接返回 #f
        ((eq? a (car lat)) #t) ;; 查看lat的第一个元素是否等于 a
        (else (member? a (cdr lat))))) ;; 判断剩下的元素是否包含 a

;; 书中的写法,使用or
(define (member? a lat)
    (cond 
        ((null? lat) #f)
        (else (or (eq? a (car lat))
                  (member? a (cdr lat))))))

;; 测试
(member? 'meat '(mashed potatoes and meat gravy)) ;; Expect #t
