;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; active company
(global-company-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; which key
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(which-key-mode 1)
(setq which-key-separator " -> " )
(setq which-key-special-keys nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; fuzzy match
(setq 
    helm-M-x-fuzzy-match t
    helm-buffers-fuzzy-matching t
    helm-recentf-fuzzy-match t
) 

;; load helm config
(require 'helm-config)

;; key bindings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
;(global-set-key (kbd "C-x C-r") 'helm-recentf)
;(global-set-key (kbd "C-x C-m") 'helm-mini)
;(global-set-key (kbd "C-x C-f") 'helm-find-files)

(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-complete)
