;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package ivy 
    :demand 
    :hook (after-init . ivy-mode) 
    :config 
    (ivy-mode 1) 
    (setq ivy-use-virtual-buffers t 
        ivy-initial-inputs-alist nil 
        ivy-count-format "%d/%d " 
        enable-recursive-minibuffers t 
        ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
    :init
    (setq ivy-height 20)
)


(use-package counsel 
    :after (ivy) 
    :bind (
        ("M-x" . counsel-M-x) 
        ("C-x C-f" . counsel-find-file) 
        ("C-x C-r" . counsel-recentf)
        ("C-x C-b" . switch-to-buffer)
        ("C-c g" . counsel-git)
        ("C-x r b" . counsel-bookmark)
    )
) 

(use-package swiper 
    :after ivy 
    :bind (
        ("C-s" . swiper)
        ("C-r" . swiper-isearch-backward)
    )
    :config (setq swiper-action-recenter t 
        swiper-include-line-number-in-search t)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-ivy)
