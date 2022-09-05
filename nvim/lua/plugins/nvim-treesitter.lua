local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then 
  return 
end

nvim_treesitter.setup {
  ensure_installed = { 
    'c', 'cpp', 'css', 'html', 'javascript', 'json', 'lua', 'python', 
    'typescript', 'elixir', 'haskell', 'rust', 'markdown'
  }, 
  sync_install = false, 

  highlight = { 
    enable = true, 
  },
}
