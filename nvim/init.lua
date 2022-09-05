require("core/options")
require("core/keymaps")
require("plugins")
require("plugins/nvim-lspconfig")
require("plugins/nvim-cmp")
require("plugins/nvim-treesitter")
require("plugins/telescope")
-- telescope.load_extension("file_browser")
-- require("plugins/telescope").load_extension("file_browser")
--require("plugins/telescope").load_extension("fzf")
-- require("plugins/telescope").load_extension("frecency")


vim.opt.statusline = "%!v:lua.require'ui.statusline'.run()"


