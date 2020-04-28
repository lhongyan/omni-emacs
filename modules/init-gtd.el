;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; GTD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org 
	:init
	(setq inhibit-compacting-font-caches t)
	(setq org-startup-indented t)
	(setq org-tags-column -20)
	(setq org-export-backends (quote (ascii html icalendar latex md)))
	(setq org-todo-keywords '(
		(sequence "IDEA(a)" "TASK(b)" "|")
	    (sequence "TODO(1)" "DONE(2)" "CANCEL(3)" "|")
	))
	(setq org-todo-keyword-faces '(
		("IDEA" . "#990073")
		("TASK" . "#004c99")
		("TODO" . "#999900")
		("DONE" . " #269900")
		("CANCEL" . "#C76B95")
	))
	(setq org-tag-alist '(
		(:startgroup . nil)
		("电话邮件" . ?a) ("会议议事" . ?b) ("等待他人" . ?c) ("外出办事" . ?d)
		(:endgroup . nil)

		(:startgroup . nil)
		("购物网购" . ?f) ("回家路上" . ?h) ("碎片时间" . ?o) ("任何地方" . ?e) 
		(:endgroup . nil)

		(:startgroup . nil)
		("在公司" . ?k) ("在家里" . ?l) ("电脑前" . ?i) ("手机前" . ?j)
		(:endgroup . nil)
	))
	:bind
	("C-c a" . org-agenda)
	("C-c c" . org-capture)
	:commands
	(org-align-all-tags)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-gtd)
