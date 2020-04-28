# 2019年12月25日

```
(use-package gruvbox-theme
    :config
    (load-theme 'gruvbox-dark-medium t)
)
```

# 2019年12月27日

```
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; startup time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'emacs-startup-hook 
	(lambda () 
			(message "Emacs ready in %s with %d garbage collections." 
	              (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time))) 
	              gcs-done
	        )
	)
)
```

# 2019年12月30日

```
(use-package doom-modeline
    :ensure t
    :init
    (setq doom-modeline-height 5)
    (setq doom-modeline-buffer-file-name-style 'file-name)
    (setq doom-modeline-indent-info t)
    (setq doom-modeline-icon (display-graphic-p))
    :hook (after-init . doom-modeline-mode)
)
```


# 2019年12月31日

```
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; disable-mouse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package disable-mouse
    :init
    :config
    (global-disable-mouse-mode)
)
```

# 2020年1月3日 

```
;; English Font
;;(set-face-attribute 'default nil :font EMACS_ENGLISH_FONT)
```

# 2020年1月14日

```
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package evil
    :ensure t
    :defer t
    :init
    (evil-mode)
    ;; remove default evil-toggle-key C-z, manually setup later
    (setq evil-toggle-key "")
    ;; don't bind [tab] to evil-jump-forward
    (setq evil-want-C-i-jump nil)
    ;; remove all keybindings from insert-state keymap
    (setcdr evil-insert-state-map nil) 
    ;; remove all keybindings from insert-state keymap
    (define-key evil-insert-state-map [escape] 'evil-normal-state)
    ;; Use j/k to move one visual line insted of gj/gk
    (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    
)
```

# 2020年1月19日

```
;;(custom-set-variables
    ;;   '(fringe-mode 0 nil (fringe)))
    ;; backgroud color
    ;;(set-background-color "#D5DDE0")

```

```
(custom-set-variables
    ;;    '(fringe-mode 0 nil (fringe))
    )
    (custom-set-faces

    )
```

```
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; startup time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'emacs-startup-hook 
	(lambda () 
        (message "Emacs ready in %s with %d garbage collections." 
            (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time))) 
            gcs-done
        )
	)
)
```

```
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; expand region
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package expand-region
    :bind
    ("C-= =" . er/expand-region)
    ("C-= w" . er/mark-word)
    ("C-= s" . er/mark-symbol)
    ("C-= i q" . er/mark-inside-quotes)
    ("C-= o q" . er/mark-outside-quotes)
    ("C-= i p" . er/mark-inside-pairs)
    ("C-= o p" . er/mark-outside-pairs)
    ("C-= c" . er/mark-comment)
    ("C-= u" . er/mark-url)
)
```


```
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; 外观 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package diminish
        :disabled
    :init
    (diminish 'helm-mode "[H]")
    (diminish 'projectile-mode "[P]")
    (diminish 'company-mode "[C]")
    (diminish 'which-key-mode "[W]")
    (diminish 'yas-minor-mode "[Y]")
    (diminish 'undo-tree-mode "[U]")
    (diminish 'eldoc-mode "[E]")
)
```
