;; Author: Anachuri Nicolas Daniel
;; Date: <2022-07-20 Wed>

;; ======== ORG MODE CONF =============


;;(provide 'org)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "0ed28b0694dd2c7a2407598e63650a8562b9e833a1a136ee74790a74d3776d3b" "0d2882cc7dbb37de573f14fdf53472bcfb4ec76e3d2f20c9a93a7b2fe1677bf5" default))
 '(package-selected-packages
   '(clojure-mode-extra-font-locking clojure-mode tree-sitter-langs tree-sitter projectile doom-themes catppuccin-theme vterm org-superstar swiper-helm helm counsel ivy haskell-mode use-package evil company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "JetBrains Mono" :height 160))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#DCDCCC" :font "JetBrains Mono" :height 1.8 :underline nil))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#DCDCCC" :font "JetBrains Mono" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#DCDCCC" :font "JetBrains Mono" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#DCDCCC" :font "JetBrains Mono" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#DCDCCC" :font "JetBrains Mono" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#DCDCCC" :font "JetBrains Mono"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#DCDCCC" :font "JetBrains Mono"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#DCDCCC" :font "JetBrains Mono"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#DCDCCC" :font "JetBrains Mono"))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(variable-pitch ((t (:family "JetBrains Mono" :height 180 :weight medium))))
 '(whitespace-tab ((t (:foreground "#636363")))))

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

; Basics
(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
    '(("^ *\\([-]\\)"
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

; Org superstar
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda ()  (org-superstar-mode 1)))

(setq inhibit-compacting-font-caches t)


; FACES
(let* ((variable-tuple
          (cond ((x-list-fonts "JetBrains Mono")         '(:font "JetBrains Mono"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 1.75 :underline nil))))))


(custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "JetBrains Mono" :height 180 :weight medium))))
   '(fixed-pitch ((t ( :family "FiraCode Nerd Font" :height 160)))))

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info ((t (:foreground "gray"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "deep sky blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

(setq backward-delete-char-untabify-method 'hungry)

(setq whitespace-style '(face tabs tab-mark trailing))

(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere


(setq org-superstar-leading-bullet "  ")
(setq org-image-actual-width nil)
