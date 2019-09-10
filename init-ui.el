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
(require 'color-theme-sanityinc-tomorrow)

;; window size
(set-frame-width (selected-frame) 150)
(set-frame-height (selected-frame) 50)

;; window position
(set-frame-position (selected-frame) 500 200)

;; time
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; high line
(global-hl-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-ui)
