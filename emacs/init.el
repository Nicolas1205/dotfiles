;;;========= EMACS INIT FILE ================
;;; Author: Anachuri Nicolas Daniel
;;; Date: <2022-07-25 Mon>
;;; Emacs init.el file config
;;; Licence is what the fuck you want


; === ALL THE ICONS ===
(when (display-graphic-p)
  (require 'all-the-icons))

(use-package all-the-icons
  :if (display-graphic-p))


(defvar consult--source-recent-file nil)

;(add-to-list 'load-path "~/.emacs.d/elisp")

;(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))


;(load "~/.emacs.d/elisp/options")
(load "~/.emacs.d/elisp/org-mode")
;(load "~/.emacs.d/elisp/keymaps")
;(load "~/.emacs.d/elisp/evil")
;(load "~/.emacs.d/elisp/treesitter")

; ========= EVIL MODE =========
;; Date: <2022-07-20 Wed>
;; Author: Anachuri Nicolas Daniel

(require 'package)
;(package-initialize)
(add-to-list 'package-archives
   '("melpa" . "https://melpa.org/packages/") t )
;(package-refresh-contents)

(setq evil-want-keybiding t)

(require 'evil)
(evil-mode 1)
(evil-collection-init)



;; ======  KEY BINDING ======

(general-define-key
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "M-<up>" 'move-dup-move-lines-up
 "M-<down>" 'move-dup-move-lines-down
 "SPC" 'projectile-find-file
 "w t" 'kill-this-buffer
 "f s" 'save-buffer
 "w k" 'evil-window-up
 "w j" 'evil-window-down
 "w l" 'evil-window-right
 "w h" 'evil-window-left
 "U"   'undo-redo
 ;"w L" 'split-window-horizontally
 ;"w K" 'split-window-vertically
 ":" 'execute-extended-command
 "." 'find-file
 ;"," 'rit-switch-to-file-buffer
 "," 'consult-buffer
 "f r" 'consult-recent-file
 "c f" 'consult-flymake
 "/" 'consult-line
 "c t" 'consult-theme
 "c g" 'consult-goto-line
 "c m" 'consult-kmacro
 "c r" 'consult-register
 "e n" 'next-error
 "e p" 'previous-error
 ;;"m s" 'magit-status
 ;;"m l" 'magit-log-all
 ;;"m p" 'magit-push
 ;;"m c" 'magit-commit
 ;;"m p r" 'magit-pull.rebase
 ;;"m r" 'magit-rebase
)

;; ========= OPTIONS =========

;;(provide 'options)
(load-theme 'doom-one t)

;(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 150)
(set-face-attribute 'default nil :font "JetBrains Mono" :height 120)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(when ( fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when ( fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when ( fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(global-hl-line-mode t)

(setq inhibit-startup-message t)

; Font Face

(set-face-attribute 'default nil :height 250)

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

(setq custom-tab-width 2)
(setq indent-tabs-mode nil)

(defun disable-tabs () (setq indent-tabs-mode nil))

(defun enable-tabs  ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs

(add-hook 'prog-mode-hook 'enable-tabs)
(add-hook 'org-mode-hook 'indent-tabs-mode)
;(add-hook 'org-mode-hook 'enable-tabs)
;; Hooks to Disable Tabs
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)



;;; ====== MARKDOWN MODE ============

(setq markdown-header-scaling t)
(setq markdown-enable-highlighting-syntax t)
(setq markdown-enable-math t)
;(setq mardown-toggle-markup-hiding t)


;;; ========= MODE LINE =========

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 3)
  (setq doom-modeline-icon t)
  (setq doom-modeline-buffer-encoding nil)
  (set-face-attribute 'mode-line nil :height 200))


;; === LIGATURES =====


(use-package ligature
  :load-path "~/.emacs.d/elpa/ligature.el"
  :config
  ;; Enable all JetBrains Mono ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("-|" "-~" "---" "-<<" "-<" "--" "->" "->>" "-->" "///" "/=" "/=="
                                      "/>" "//" "/*" "*>" "***" "*/" "<-" "<<-" "<=>" "<=" "<|" "<||"
                                      "<|||" "<|>" "<:" "<>" "<-<" "<<<" "<==" "<<=" "<=<" "<==>" "<-|"
                                      "<<" "<~>" "<=|" "<~~" "<~" "<$>" "<$" "<+>" "<+" "</>" "</" "<*"
                                      "<*>" "<->" "<!--" ":>" ":<" ":::" "::" ":?" ":?>" ":=" "::=" "=>>"
                                      "==>" "=/=" "=!=" "=>" "===" "=:=" "==" "!==" "!!" "!=" ">]" ">:"
                                      ">>-" ">>=" ">=>" ">>>" ">-" ">=" "&&&" "&&" "|||>" "||>" "|>" "|]"
                                      "|}" "|=>" "|->" "|=" "||-" "|-" "||=" "||" ".." ".?" ".=" ".-" "..<"
                                      "..." "+++" "+>" "++" "[||]" "[<" "[|" "{|" "??" "?." "?=" "?:" "##"
                                      "###" "####" "#[" "#{" "#=" "#!" "#:" "#_(" "#_" "#?" "#(" ";;" "_|_"
                                      "__" "~~" "~~>" "~>" "~-" "~@" "$>" "^=" "]#"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))


;; ========= VERTICO MODE =========

;; Use `consult-completion-in-region' if Vertico is enabled.
;; Otherwise use the default `completion--in-region' function.
(setq completion-in-region-function
      (lambda (&rest args)
        (apply (if vertico-mode
                   #'consult-completion-in-region
                 #'completion--in-region)
               args)))

(defun rit-check-buffer-mode (str mode)
  "Check whether the buffer's major mode is `mode'."
  (let ((buf (get-buffer str)))
    (and buf (eq (buffer-local-value 'major-mode buf) mode))))


(defun rit-switch-to-file-buffer ()
  "Switch to non-virtual and non-dired buffer."
  (interactive)
  (switch-to-buffer (read-buffer "Buffer: " nil t #'(lambda (arg)
                                                      (let ((str (car arg)))
                                                        (not (or
                                                          (string-match-p "^ " str)
                                                          (string-match-p "^\\*" str)
                                                          (rit-check-buffer-mode str 'dired-mode))))))))


(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package vertico
  :init
  (vertico-mode))

(use-package vertico-directory
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package marginalia
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))


;;; ==== RECENT-FILES =======

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items-50)

;;;  ========= RUST MODE ========

(require 'rust-mode)

(add-hook 'rust-mode-hook
    (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook
    (lambda () (prettify-symbols-mode)))

(setq rust-format-on-save t)

;  ======= HASKELL ===========

;;(add-hook ’haskell-mode-hook ’interactive-haskell-mode)
;;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;;(custom-set-variables '(haskell-process-type 'cabal-repl))
;;(setq haskell-ghci-program-name "cabal")
;;(setq haskell-ghci-program-args '("repl"))


(defun er-auto-create-missing-dirs ()
  (let ((target-dir (file-name-directory buffer-file-name)))
    (unless (file-exists-p target-dir)
      (make-directory target-dir))))

(add-to-list 'find-file-not-found-funtions #'er-auto-create-missings-dirs)

(use-package autothemer
  :ensure t)

(load "~/.emacs.d/themes/catppuccin-mocha-theme")

