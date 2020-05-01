;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; dashboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package dashboard
    :ensure t
    :init
    (setq dashboard-banner-logo-title "Welcome to Omni Emacs")
    (setq dashboard-startup-banner 2)
    (setq dashboard-center-content t)
    (setq dashboard-show-shortcuts nil)
    (setq dashboard-items '(
        (recents  . 20)
        (bookmarks . 10)
    ))
    :config
    (dashboard-setup-startup-hook))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-dashboard)