;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 代码相关操作
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 为Java 字段添加 private String 和 ;
(fset 'java-field-add-private-string
    "\C-aprivate String \C-e;\C-n")
;; 为Java 字段添加 result column 和 property
(fset 'java-filed-add-result-string
    "\C-a<result column=\"\C-@\C-e\367\C-@\" property=\"\C-y\" jdbcType=\"VARCHAR\" />\C-n")
;; 为Java 字段添加 private String 和 ;
(fset 'java-field-add-private-string
    "\C-aprivate String \C-e;\C-n")
;; 为Java 字段添加 result column 和 property
(fset 'java-filed-add-result-string
    "\C-a<result column=\"\C-@\C-e\367\C-@\" property=\"\C-y\" jdbcType=\"VARCHAR\" />\C-n")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 文本相关操作
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 清空Buffer
(fset 'm-buffer-clean-all
    [?\M-< ?\C-@ ?\M-> backspace])
;; 全选
(fset 'm-buffer-select-all
    "\274\C-@\276")
;; 全选-复制
(fset 'm-buffer-copy-all
    "\274\C-@\276\367")
;; 全选-剪切
(fset 'm-buffer-cut-all
    "\274\C-@\276\C-w")
;; 重复当前行
(fset 'm-buffer-duplicate-line
    [?\C-a ?\C-@ ?\C-e ?\M-w return ?\C-y])
;; 删除当前行
(fset 'm-buffer-delete-line
    [?\C-a ?\C-k backspace])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 默认Vim操作符待决策模式
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;删除""之间的数据
(fset 'delete-english-double-quota-inner-text
    [?\C-r ?\" return right ?\C-@ ?\C-s ?\" return left backspace])

;; 删除""及之间的数据
(fset 'delete-english-double-quota-outer-text
    [?\C-r ?\" return ?\C-@ ?\C-s ?\" return ?\C-s ?\" return backspace])

;; 删除[]之间的数据
(fset 'delete-english-square-bracket-inner-text
   [?\C-r ?\[ return right ?\C-@ ?\C-s ?\] return left backspace])

;;删除[]及之间的数据
(fset 'delete-english-square-bracket-outer-text
   [?\C-r ?\[ return ?\C-@ ?\C-s ?\] return backspace])

;; 删除{}之间的数据
(fset 'delete-english-brace-inner-text
   [?\C-r ?\{ return right ?\C-@ ?\C-s ?\} return left backspace])

;; 删除{}及之间的数据
(fset 'delete-english-brace-outer-text
   [?\C-r ?\{ return ?\C-@ ?\C-s ?\} return backspace])

;; 删除''之间的数据
(fset 'delete-english-single-quota-inner-text
   [?\C-r ?\' return right ?\C-@ ?\C-s ?\' return left backspace])

;; 删除''及之间的数据
(fset 'delete-english-single-quota-inner-text
   [?\C-r ?\' return right ?\C-@ ?\C-s ?\' return left backspace])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-macros)
