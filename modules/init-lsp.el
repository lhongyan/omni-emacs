;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; language server protecl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package lsp-mode
	:init
	(setq lsp-keymap-prefix "C-c l")
	:hook (
		(html-mode . lsp)
		(lsp-mode . lsp-enable-which-key-integration)
	)
	:commands 
	lsp
)

(use-package helm-lsp 
	:commands helm-lsp-workspace-symbol
)

(use-package lsp-ui
    :init
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    (add-hook 'python-mode-hook 'flycheck-mode)
    :commands lsp-ui-mode
)

(use-package company-lsp
    :config
    (push 'company-lsp company-backends)
    :commands company-lsp
)

(use-package lsp-treemacs 
	:commands lsp-treemacs-errors-list
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-lsp)