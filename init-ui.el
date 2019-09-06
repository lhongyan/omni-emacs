;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; UI 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; close tool bar
(tool-bar-mode -1)

;; close scroll bar
(scroll-bar-mode -1)

;; close menu bar
(menu-bar-mode -1)

;; cursor style like "|"
(setq-default cursor-type 'bar)

;; close home page
(setq inhibit-splash-screen t)

;; theme
;;(load-theme 'atom-one-dark t)
(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow-eighties)

;; window size
(set-frame-width (selected-frame) 150)
(set-frame-height (selected-frame) 50)

;; window position
(set-frame-position (selected-frame) 500 200)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-ui)
