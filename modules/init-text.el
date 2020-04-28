;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 文本操作
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package drag-stuff 
    :bind (
        ("<M-up>". drag-stuff-up) 
        ("<M-down>" . drag-stuff-down)
    )
)

(delete-selection-mode t)

(use-package expand-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-text)