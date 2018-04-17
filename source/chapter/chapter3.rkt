;; 用cons构筑恢宏

;; rember函数定义 将一个原子a和一个列表lat作为参数,生成一个新列表,新列表为剔除了首个a的lat

;; 3.1 第一版函数
;; 1.判断lat是否为空,如果为空返回空列表,否则继续
;; 2.判断lat第一个元素是否为a,如果是返回(cdr lat),否则对(cdr lat)调用lat函数
(define (rember a lat)
    (cond 
        ((null? lat) (quote ()))
        (else (cond 
            ((eq? (car lat) a) (cdr lat))
            (else (rember a (cdr lat)))))))

;; 3.2 第二版函数
;; 描述:函数rember逐一查找列表lat中的每个原子,看看该原子是不是与原子a相同。如果car不是a,就保存car以便后续cons到最终结果
;;     如果rember找到了原子a,则剔除掉原子a,并将之前的原子cons到lat的剩余部分
(define (rember a lat)
    (cond 
        ((null? lat) (quote ()))
        (else (cond 
            ((eq? (car lat) a) (cdr lat))
            (else (cons (car lat) 
                        (rember a (cdr lat))))))))

;; 3.3 第三版优化询问语句函数

(define (rember a lat)
    (cond 
        ((null? lat) (quote ()))
        ((eq? a (car lat)) (cdr lat))
        (else (cons (car lat) 
                    (rember a (cdr lat))))))

;; 3.4 first函数:first函数以一个列表l为参数,该列表要么为空列表,要么只包含非空列表.该函数构建出
;; 一个新列表,新列表中的元素由列表l中每个内部列表的第一个S-表达式组成。

(define (first lat)
    (cond 
        ((null? lat) (quote ()))
        (else (cons (car (car lat)) 
                    (first (cdr lat))))))

;; 测试
(define lat '((a c) (b e) (f g) (vac kkk)))
(first lat)
;; >> '(a b f vac)

;; scheme十诫之第二诫 - 使用 cons 来构建列表
;; scheme 十诫之第三诫 - 构建一个列表的时候,描述第一个典型元素,之后 cons 该元素到一般性递归(natural recursion)上。 