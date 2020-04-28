;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package which-key
    :init
    (setq which-key-paging-prefixes '("C-x"))
    (setq which-key-paging-key "<f5>")
    (setq which-key-separator " -> " )
    (setq which-key-special-keys nil)
    (setq which-key-idle-delay 0.5)
    (setq which-key-idle-secondary-delay 0.05)
    (which-key-setup-side-window-bottom)
    (which-key-mode 1)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-whichkey)