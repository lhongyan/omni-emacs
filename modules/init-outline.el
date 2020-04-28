;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 大纲
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 
(use-package imenu-list
    :init
    (setq imenu-list-focus-after-activation t)
    (setq imenu-list-after-jump-hook nil)
    :bind
    ("C-'" . imenu-list-smart-toggle)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-outline)