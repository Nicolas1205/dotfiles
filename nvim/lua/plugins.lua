vim.cmd [[packadd packer.nvim]]

local packer = require("packer")

return packer.startup(function () 

  use "wbthomason/packer.nvim"

  -- === CORE ===
 
  use 'nvim-treesitter/nvim-treesitter'


  use 'neovim/nvim-lspconfig'

  use { 
    'hrsh7th/nvim-cmp', 
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp', 
      'hrsh7th/cmp-path', 
      'hrsh7th/cmp-cmdline', 
    },
  }

  -- === TELESCOPE === --
  
  use 'nvim-lua/plenary.nvim'

  use { 
    'nvim-telescope/telescope.nvim', 
    cmd = "Telescope", 
    -- module = "telescope",
  }


  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  
  use {
    'nvim-telescope/telescope-frecency.nvim',
    requires = 'tami5/sql.nvim',
  }

  use { 
    "nvim-telescope/telescope-file-browser.nvim",
    after = "telescope", 
    config = function() 
      requires("telescope").load_extension("file_browser")
    end,
  }

  -- === MISC === 

  use "lukas-reineke/indent-blankline.nvim"

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }
  
  -- = gitsigns = --
  use { 
    'lewis6991/gitsigns.nvim', 
    opt = true, 
    config = function() 
      require("plugins.gitsigns")
    end, 
  }
 
  -- WEB DEV ICONS -- 
  use { 
    'kyazdani42/nvim-web-devicons'
  }
  -- === COLORSCHEMES ===  --

  use {
    "catppuccin/nvim", 
    as = "catppuccin", 
    config = function()
        require("ui.catppuccin")
      end,
    }
  
  -- === TROUBLE === --- 
  use {
    'folke/trouble.nvim', 
    config = function()
      require('trouble').setup()
    end
  }
 




end)
