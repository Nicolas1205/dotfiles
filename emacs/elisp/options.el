;;(provide 'options)
(load-theme 'doom-one t)

; === CONFIG ==

;(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 150)
(set-face-attribute 'default nil :font "JetBrains Mono" :height 140)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(when ( fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when ( fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when ( fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(global-hl-line-mode t)

(setq inhibit-startup-message t)

; Font Face

;(set-face-attribute 'default nil :height 250)

; Relative Numbers

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

; SCROLL

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; FACEMENU

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/facemenu.el")


; Tab configuration

(setq custom-tab-width 4)
;(setq indent-tabs-mode nil)

(defun disable-tabs () (setq indent-tabs-mode nil))

(defun enable-tabs  ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs
(add-hook 'prog-mode-hook 'enable-tabs)
;(add-hook 'org-mode-hook 'enable-tabs)
;; Hooks to Disable Tabs
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)


