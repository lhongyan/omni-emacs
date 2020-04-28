;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 剪切板
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package simpleclip
    :config
    (simpleclip-mode)
    :bind 
    ("M-w" . simpleclip-copy)
    ("C-w" . simpleclip-cut)
    ("C-y" . simpleclip-paste)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-clipboard)