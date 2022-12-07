;;(provide 'tree-sitter)
(require 'tree-sitter)
(require 'tree-sitter-langs)

(tree-sitter-require 'rust)
(tree-sitter-require 'haskell)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
