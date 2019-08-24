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

;; set bullet list style
(setq org-bullets-bullet-list '( "?" "?" "?" "?" "?"))

;; set todo keywords
(setq org-todo-keywords
    (quote (
            (setq "TODO(t)" "DONE(d)")
            (sequence "HOLD(h)" "CANCELLED(c)")
            (sequence "CALL(p)" "WAITING(w)" "AGENDA(a)" "MEETING(m)" "MAIL(i)")
        )
    )
)

;; set todo keywords backgroud color
(setq org-todo-keyword-faces
      (quote (("TODO" . (:foreground "white"  :weight bold))
              ("DONE" . (:foreground "forest green" :weight bold))
              ("HOLD" . (:foreground "magenta" :weight bold))
              ("CANCELLED" . (:foreground "red" :weight bold))
              ("CALL" . (:foreground "blue" :weight bold))
              ("WAITING" . (:foreground "orange" :weight bold))
              ("AGENDA" . (:foreground "orange" :weight bold))
              ("MEETING" . (:foreground "yello" :weight bold))
              ("MAIL" . (:foreground "purple" :weight bold)))))

;; open org-indent mode
(setq org-startup-indented t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;; Plain Lists
;; M-UP / M-DOWN --> Move the item including subitems up/down
;; M-LEFT / M-RIGHT --> Increase/Decrease then indentation of an item
;; C-c C-c --> If there is a checkbox in the item line, toggle the state of the checkbox
;; C-u C-c C-c --> Add the checkbox in the item line

;;; Drawers
;; C-c C-x d (org-insert-drawer) --> insert drawer

;;; Block
;; org-insert-columns-dblock --> insert block

;;;; TODO
;;; Checkbox
;; C-u C-c C-c 
;; C-c C-c (org-toggle-checkbox) --> Toggle checkbox status
;; C-c / t (org-show-todo-tree) --> View TODO items in a sparse tree

;;;; Dates and Timestamps
;;; Creating Timestamps 
;; C-c . (org-time-stamp) --> Prompt for a date and insert a corresponding timestamp

;;; Deadlines and Scheduling
;; C-c C-d (org-deadline) --> Insert DEADLINE keyword along with a stamp
;; C-c C-s (org-schedule) --> Insert SCHEDULED keyword along with a stamp

;;;; Capture, Refile, Archive
;;; Capture
;; (setq org-default-notes-file (concat org-directory "/notes.org")) --> sets a default target file for notes.
;; M-x org-capture (org-capture) --> Display the capture templates menu
;; C-c C-c (org-capture-finalize) --> returns you to the window configuration before the capture process,