;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; line number
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package linum
	:init
	(progn
		(global-linum-mode t)
		(setq linum-format "%4d")
	)
)

(use-package linum-relative
	:init
	;(setq linum-relative-backend 'display-line-numbers-mode)
	:commands
	(linum-relative-on)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-linum)