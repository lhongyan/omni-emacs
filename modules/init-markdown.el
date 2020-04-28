;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 宏
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package markdown-mode
    :bind
    ("C-c k" . markdown-move-up)
    ("C-c j" . markdown-move-down)
)

(use-package markdown-toc
	:config
	(custom-set-variables
		'(markdown-toc-header-toc-start "<!-- customized start-->")
	    '(markdown-toc-header-toc-title "**customized title**")
		'(markdown-toc-header-toc-end "<!-- customized end -->"))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-markdown)