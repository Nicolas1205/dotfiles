vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'neovim/nvim-lspconfig'
  use ({'L3MON4D3/LuaSnip', tag = "v<CurrentMajor>.*"})
  use 'onsails/lspkind.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'Mofiqul/vscode.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'ibhagwan/fzf-lua'
end)

