;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; change default setting
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

;; close auto save
(setq auto-save-default nil)

;; close bibi voice
(setq ring-bell-function 'ignore)

;; close bell
(setq visible-bell nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; enhance emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; start the rainbow mode automatically
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; show startup time
(add-hook 'emacs-startup-hook 
(lambda () 
    (message "Emacs ready in %s with %d garbage collections." 
        (format "%.2f seconds" 
            (float-time 
                (time-subtract after-init-time before-init-time))) 
    gcs-done)
))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; better move
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-key global-map (kbd "M-g g") 'ace-jump-mode)
(define-key global-map (kbd "M-g l") 'ace-jump-line-mode)
(define-key global-map (kbd "M-g c") 'ace-jump-char-mode)
(define-key global-map (kbd "M-g w") 'ace-jump-word-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; quick choose regin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq alphabet-start "abc def")
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-better)
