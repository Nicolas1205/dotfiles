;; KEY BINDING
;;(provide 'keymaps)
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
 "," 'rit-switch-to-file-buffer
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
(provide 'keymaps)
