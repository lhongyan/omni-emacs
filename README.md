# Awesome Emacs

## Require

- Emacs 24+
- Consolas (English Font)
- STKaiTi (Chinese Font)

```lisp
;; Mac OS

;; English Font
(set-face-attribute
'default nil :font "Consolas 12")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "STKaiTi" :size 14)))
```

```lisp
;; Windows

;; English Font
(set-face-attribute
'default nil :font "Consolas 12")
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "STKaiTi" :size 18)))
```

## Install

- Clone this project

> for example ：D:\\awesome-emacs

- Add this configuration to`init.el` or `.emacs` 

```lisp
(package-initialize)
(add-to-list 'load-path "D:\\awesome-emacs")
(require 'init)
```

- Enjoy Emacs
