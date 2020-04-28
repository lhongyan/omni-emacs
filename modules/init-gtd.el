;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; GTD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package org 
	:init
	(setq inhibit-compacting-font-caches t)
	(setq org-startup-indented t)
	(setq org-tags-column -20)
	(setq org-export-backends (quote (ascii html icalendar latex md)))
	:bind
	("C-c a" . org-agenda)
	("C-c c" . org-capture)
	:commands
	(org-align-all-tags)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-gtd)
