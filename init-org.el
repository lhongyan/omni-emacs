;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Org Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)

;;; key bindings
(global-set-key "\C-c l" 'org-store-link)
(global-set-key "\C-c a" 'org-agenda)
(global-set-key "\C-c b" 'org-iswitchb)

;; open org-indent mode
(setq org-startup-indented t)

;; set bullet list
(setq org-bullets-bullet-list '("☰"))

;; set todo keywords
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

;; set todo keywords backgroud color
(setq org-todo-keyword-faces
      (quote (("TODO" . (:foreground "white" :background "#95A5A6"   :weight bold))
              ("NEXT" . (:foreground "blue" :background "#95A5A6"   :weight bold))
              ("DONE" . (:foreground "forest green" :background "#95A5A6"   :weight bold))
              ("WAITING" . (:foreground "orange" :background "#95A5A6"   :weight bold))
              ("HOLD" . (:foreground "magenta" :background "#95A5A6"   :weight bold))
              ("CANCELLED" . (:foreground "forest green" :background "#95A5A6"   :weight bold))
              ("MEETING" . (:foreground "forest green" :background "#95A5A6"   :weight bold))
              ("PHONE" . (:foreground "forest green" :background "#95A5A6"   :weight bold)))))

;;;;
(provide 'init-org)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Usage
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Motion
;; C-c C-n (org-next-visible-heading) --> Next heading
;; C-c C-p (org-previous-visible-heading) --> Previous heading
;; C-c C-f (org-forward-heading-same-level) --> Next heading same level
;; C-c C-b (org-backward-heading-same-level) --> Previous heading same level
;; C-c C-u (outline-up-heading) --> Backward to higher level heading
;; C-c C-j (org-goto) --> Jump to a different place

;;; Structure Editing
;; C-RET (org-insert-heading-respect-content) --> Insert a new heading at the end of the current subtree