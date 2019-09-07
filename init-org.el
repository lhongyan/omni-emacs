;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Org Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org)

;; org key bindings
(global-set-key "\C-c l" 'org-store-link)
(global-set-key "\C-c a" 'org-agenda)
(global-set-key "\C-c b" 'org-iswitchb)

;; open org-indent mode
(setq org-startup-indented t)

;; set todo keywords
(setq org-todo-keywords
    (quote (
            (sequence "TODO(t)" "DONE(d)" "HOLD(h)" "CANCELLED(c)")
            (sequence "CALL/MAIL(p)" "WAITING(w)" "AGENDA(a)" "MEETING(m)")
            (sequence "BUG(b)" "FIX(f)")
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
