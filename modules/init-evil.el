;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package evil
    :init
    (evil-mode)
    ;; don't bind [tab] to evil-jump-forward
    (setq evil-want-C-i-jump nil)
    (setq evil-default-state 'normal)
    ;; 默认使用Emacs模式
    (define-key evil-insert-state-map [escape] 'evil-normal-state)
    ;; Use j/k to move one visual line insted of gj/gk
    (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    ;; C-o 临时进入普通模式
    (define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
    (define-key evil-normal-state-map "t" 'evil-use-register)
    ;; 光标样式
    (setq evil-emacs-state-cursor 'hbar
	evil-normal-state-cursor 'box
	evil-insert-state-cursor 'bar
        evil-visual-state-cursor 'hollow)
    :config
    (use-package evil-easymotion
        :init
        (evilem-default-keybindings "SPC")
        (evilem-define (kbd "SPC w") 'evil-forward-word-begin)
        (evilem-define (kbd "SPC b") 'evil-backward-word-begin)
    )
    (use-package evil-surround
        :ensure t
        :config
        (global-evil-surround-mode 1)
    )
)

(defun evil-execute-in-normal-state ()
  "Execute the next command in Normal state. C-o o works in insert-mode"
  (interactive)
  (evil-delay '(not (memq this-command
			  '(evil-execute-in-normal-state
			    evil-use-register
			    digit-argument
			    negative-argument
			    universal-argument
			    universal-argument-minus
			    universal-argument-more
			    universal-argument-other-key)))
      `(progn
	 (if (evil-insert-state-p)
	     (let ((prev-state (cdr-safe (assoc 'normal evil-previous-state-alist))))
	       (evil-change-state prev-state)
	       (setq evil-previous-state 'normal))
	   (evil-change-to-previous-state))
	 (setq evil-move-cursor-back ',evil-move-cursor-back))
    'post-command-hook)
  (setq evil-move-cursor-back nil)
  (evil-normal-state)
  (evil-echo "Switched to Normal state for the next command ..."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-evil)
