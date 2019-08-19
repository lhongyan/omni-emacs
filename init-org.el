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
    (quote (
            (sequence "TODO(t)" "NEXT(n)" "DONE(d)" "HOLD(h)" "CANCELLED(c)")
            (sequence "CALL(p)" "WAITING(w)" "AGENDA(a)"  "MEETING(m)" "MAIL(i)")
        )
    )
)

;; set todo keywords backgroud color
(setq org-todo-keyword-faces
      (quote (("TODO" . (:foreground "white"  :weight bold))
              ("NEXT" . (:foreground "blue" :weight bold))
              ("DONE" . (:foreground "forest green" :weight bold))
              ("WAITING" . (:foreground "orange" :weight bold))
              ("HOLD" . (:foreground "magenta" :weight bold))
              ("CANCELLED" . (:foreground "red" :weight bold))
              ("MEETING" . (:foreground "yello" :weight bold))
              ("PHONE" . (:foreground "purple" :weight bold)))))

;;;;
(provide 'init-org)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Usage
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; Document Structure
;;; Motion
;; C-c C-n (org-next-visible-heading) --> Next heading
;; C-c C-p (org-previous-visible-heading) --> Previous heading
;; C-c C-f (org-forward-heading-same-level) --> Next heading same level
;; C-c C-b (org-backward-heading-same-level) --> Previous heading same level
;; C-c C-u (outline-up-heading) --> Backward to higher level heading
;; C-c C-j (org-goto) --> Jump to a different place

;;; Structure Editing
;; C-RET (org-insert-heading-respect-content) --> Insert a new heading at the end of the current subtree
;; M-UP (org-move-subtree-up) --> Move subtree up
;; M-DOWN (org-move-subtree-down) -->Move subtree down
;; M-LEFT (org-do-promote) --> Promote current heading by one level
;; M-RIGHT (org-do-demote) --> Demote current heading by one level

;;;; TODO
;;; Checkbox
;; C-u C-c C-c 
;; C-c C-c