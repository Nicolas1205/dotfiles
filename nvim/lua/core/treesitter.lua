local treesitter = require('nvim-treesitter')

treesitter.setup {
  ensure_installed = { "c", "rust", "haskell", "clojure", "elixir" },
  highlight = {
    enable  = true,
  }
}
