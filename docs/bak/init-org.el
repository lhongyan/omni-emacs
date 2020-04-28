;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; org 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 设置标签/情境
(setq org-tag-alist '(
	(:startgroup . nil)
	("@电话邮件" . ?a) ("@会议议事" . ?b) ("@等待他人" . ?c) ("@外出办事" . ?d)
	(:endgroup . nil)

	(:startgroup . nil)
	("@购物网购" . ?f) ("@回家路上" . ?h) ("@碎片时间" . ?o) ("@任何地方" . ?e) 
	(:endgroup . nil)

	(:startgroup . nil)
	("@在公司" . ?k) ("@在家里" . ?l) ("@在食堂" . ?m) ("@住宿地" . ?n)
	(:endgroup . nil)

	(:startgroup . nil)
	("@电脑前" . ?i) ("@手机前" . ?j) ("@已完成" . ?y)
	(:endgroup . nil)
))

;; 设置状态
(setq org-todo-keywords '(
	;; 收集想法、任务、灵感
	(sequence "INSPIRATION(a)" "IDEA(b)" "TASK(c)" "|")
	;; 如果不可行，将其变为CANCEL/MAYBE
	;; 如果可行，且是一步行动:
	;;         1.能在两分钟完成立即去做，将其变为DONE
	;;         2.不能在两分钟完成，将其变为TODO
        (sequence "TODO(1)" "DONE(2)" "CANCEL(3)" "MAYBE(4)" "|")
        ;; 如果可行，且不是一步行动：将其变为PROJECT，使用CheckBox列出需要的步骤
	(sequence "PROJECT(p)" "|")
	;; 如果是比较重要的项目，为该项目单独设置状态
))

;; agenda file path
(setq org-agenda-files (list 
	"D:\\Users\\unixman\\坚果云\\事务管理\\晨间日记.org"
        "D:\\Users\\unixman\\坚果云\\事务管理\\年度规划.org"
	"D:\\Users\\unixman\\坚果云\\事务管理\\日程管理.org"
	"D:\\Users\\unixman\\坚果云\\事务管理\\项目管理.org"
	"D:\\Users\\unixman\\坚果云\\事务管理\\信息收集.org"
))

;; capture
(setq org-capture-templates '(
	("p" "任务" entry (file+headline "D:\\Users\\unixman\\坚果云\\事务管理\\信息收集.org" "突发") "* %?\n  %i\n  %a")
	("i" "想法" entry (file+headline "D:\\Users\\unixman\\坚果云\\事务管理\\信息收集.org" "想法") "* %?\n  %i\n  %a")
))

(use-package org 
    	:init
    	(setq org-startup-indented nil)
    	(setq org-export-backends (quote (ascii html icalendar latex md)))
    	:bind
    	("C-c a" . org-agenda)
    	("C-c c" . org-capture)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-org)
