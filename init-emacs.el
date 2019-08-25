;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Change Emacs Default Setting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; no backup
(setq make-backup-files nil)

;; open selection mode
(delete-selection-mode 1)

;; recent file
(recentf-mode 1)

;; indent setting
(setq default-tab-width 4)
(setq default-indent-tabs-mode nil)
(electric-indent-mode nil)

;; start the rainbow mode automatically in most programming modes (Emacs 24 and above)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; close auto save
(setq auto-save-default nil)

;; close bibi voice
(setq ring-bell-function 'ignore)

;; close bell
(setq visible-bell nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Module Manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Package Manager
(require 'init-package)

;; UI
(require 'init-ui)

;; Complete
(require 'init-complete)

;; Org
(require 'init-org)

;; Evil
(require 'init-evil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-emacs)

;; start time
(add-hook 'emacs-startup-hook 
(lambda () 
    (message "Emacs ready in %s with %d garbage collections." 
        (format "%.2f seconds" 
            (float-time 
                (time-subtract after-init-time before-init-time))) 
    gcs-done)
))
