;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package yasnippet
    :init
    (add-hook 'prog-mode-hook #'yas-minor-mode)
    ;;  这个函数不存在，启用python时会报错，手动定义下
	(defun yasnippet-snippets--fixed-indent())
    :config
    (yas-global-mode 1)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-snippets)