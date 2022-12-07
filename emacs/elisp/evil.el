; EVIL MODE
;; Date: <2022-07-20 Wed>
;; Author: Anachuri Nicolas Daniel

(require 'package)
;(package-initialize)
(add-to-list 'package-archives
   '("melpa" . "https://melpa.org/packages/") t )
;(package-refresh-contents)

(setq evil-want-keybiding nil)

(require 'evil)
(evil-mode 1)
(evil-collection-init)
