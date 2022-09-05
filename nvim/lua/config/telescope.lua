local telescope = require 'telescope'
local previewers = require('telescope.previewers')
local actions  = require('telescope.actions')

local new_maker = function(filepath, bufnr  , opts)
  opts = opts or {}
  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return 
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end 
  end)
end

telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    previewer = false,
    buffer_previewer_maker = new_maker,
    mappings =  {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },

  extensions  = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
      previewer = false,
    },
    file_browser = { 
      theme = "ivy",
    },
    
  },
  pickers = {
    lsp_references = {theme = 'ivy'},
    lsp_code_actions = {theme = 'ivy'},
    lsp_definitions = {theme = 'ivy' },
    lsp_implementations= {theme = 'ivy',
    buffers = {
      sort_lasused = true,
      previewer = false,
    },
    
  },

  }
} 

telescope.load_extension 'frecency'
telescope.load_extension 'fzf'
telescope.load_extension 'file_browser'
