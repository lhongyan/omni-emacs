;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package helm
    :init
    (setq helm-M-x-fuzzy-match t)
    (setq helm-buffers-fuzzy-matching t)
    (setq helm-recentf-fuzzy-match t)
    (require 'helm-config)
    :bind 
    ("M-x" . helm-M-x)
    ("C-x C-b" . helm-buffers-list)
    ("C-x r b" . helm-bookmarks)
    :config
    (helm-mode)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-helm)