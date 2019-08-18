;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; UI 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; close tool bar
(tool-bar-mode -1)

;; close scroll bar
(scroll-bar-mode -1)

;; cursor style
(setq-default cursor-type 'bar)

;; heign line
(global-hl-line-mode 1)

;; close home page
(setq inhibit-splash-screen 1)

;; theme
(load-theme 'atom-one-dark 1)

;; window size
(set-frame-width (selected-frame) 120)
(set-frame-height (selected-frame) 40)

;; window position
(set-frame-position (selected-frame) 500 200)

;;;;
(provide 'init-ui)
