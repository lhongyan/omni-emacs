;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Module Manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Package Manager
(require 'init-package)

;; Better
(require 'init-better)

;; UI
(require 'init-ui)

;; Complete
(require 'init-complete)

;; Org
(require 'init-org)

;; Evil
;;(require 'init-evil)

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
