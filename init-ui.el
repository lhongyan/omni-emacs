;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; UI 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; close tool bar
(tool-bar-mode nil)

;; close scroll bar
(scroll-bar-mode -1)

;; close menu bar
(menu-bar-mode nil)

;; cursor style
(setq-default cursor-type 'bar)

;; heign line
(global-hl-line-mode t)

;; cursor type
(setq-default cursor-type 'bar)

;; close bell
(setq visible-bell nil)

;; close home page
(setq inhibit-splash-screen t)

;; theme
(load-theme 'atom-one-dark t)

;; window size
(set-frame-width (selected-frame) 150)
(set-frame-height (selected-frame) 50)

;; window position
(set-frame-position (selected-frame) 500 200)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-ui)
