;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
    :init
    (setq company-dabbrev-ignore-case nil)
    (setq company-dabbrev-code-ignore-case nil)
    (setq company-dabbrev-downcase nil)
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 3)
    :config
    (global-company-mode)
    (define-key company-active-map [tab] nil)
    (define-key company-active-map (kbd "TAB") nil)
    :bind
    ("M-p" . company-select-previous)
    ("M-n" . company-select-next)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-company)