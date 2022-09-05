local present, telescope = pcall(require, "telescope")

if not present then
   return
end

telescope.setup{

  extensions  = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
      -- previewer = false,
    },
    file_browser = { 
      theme = "ivy",
    },
  },
  defaults = {
    layout_strategy = 'flex',
    previewer = false,
    buffer_previewer_maker = new_maker,
  },

}

-- load extensions

-- telescope.setup(options)

--pcall(function()
--   for _, ext in ipairs(options.extensions_list) do
--      telescope.load_extension(ext)
--   end
--end)

-- telescope.load_extension 'frecency'
telescope.load_extension 'file_browser'
telescope.load_extension 'fzf'
