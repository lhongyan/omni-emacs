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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-text)