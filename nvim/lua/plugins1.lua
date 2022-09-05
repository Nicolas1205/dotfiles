vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()

  -- INSTALLING THE INSTALLER IN THE INSTALLER
  
	use 'wbthomason/packer.nvim' 

	use { 
		"folke/zen-mode.nvim", 
		requires = { 
			"folke/twilight.nvim"
		},
		config = function()
			require("zen-mode").setup {

			}
		end
	}


  -- colorscheme
  use({
	  "catppuccin/nvim",
	  as = "catppuccin"
  })

  -- LSP

  use {
    'onsails/lspkind-nvim',
    'neovim/nvim-lspconfig',
    'folke/trouble.nvim',
    'ray-x/lsp_signature.nvim',
    'kosayoda/nvim-lightbulb',
  }

  -- CMP

  use {
    'hrsh7th/nvim-cmp',
    requires ={
      'L3MON4D3/LuaSnip',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp'},
      { 'hrsh7th/cmp-nvim-lua' , after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'} ,
    },
    config  = [[require('config.cmp')]],
    event = 'InsertEnter *',
  }
  

  -- Telescope

  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      setup = [[require('config.telescope_setup')]],
      config = [[require('config.telescope')]],
      cmd = 'Telescope',
      module = 'telescope',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sql.nvim',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  }

  -- Treesitter

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = ':TSUpdate',
  }

  use { 
       "nvim-telescope/telescope-file-browser.nvim",
  }

 -- WINDLINE
    
 use { 
   'windwp/windline.nvim'
 }

 -- AUTO PAIRS
 use  {
   'windwp/nvim-autopairs',
   config = function() 
     require('nvim-autopairs').setup{}
   end,
 }

 -- A bit of emacs in my neovim
  
  use { 
    "nvim-neorg/neorg", 
    config = function()
      require('neorg').setup {
        load = { 
          ["core.defaults"] = {},
        }
      }
    end,
    requires = "nvim-lua/plenary.nvim"
  }
 

end)

