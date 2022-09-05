local servers = {
  clangd = {
    cmd = {
      'clangd',
      '--clang-tidy',
      '--completion-style=bundled',
      --'--header-insertion=iwyu',
      '--cross-file-rename',
    },
    init_options = {
      clangdFileStatus = true,
      usePlaceHolders = true,
      completeUnimported = true,
      semanticHighlighting = true,
    },
  },

  pyright = {settings = {python = {formatting = {provider = 'yapf'}}}},

  rust_analyzer = {},

  tsserver = {},

  -- svelte = {}, 
  

  hls = {
    on_attach = on_attach,
    root_dir = vim.loop.cwd,
    settings = {
      rootMarkers = {"./git/"}
    },
  },

  sqls = {
    cmd = {"sqls"},
    filetypes  = {
      "sqlite3", 
      "sql", 
      "mysql", 
    },
    root_dir = vim.loop.cwd,
    settings = {
      driver = "sqlite3",
      dataSourceName = "/home/nicolas/me/school/second/databases/data/db.sqlite3", 
    },
  },
}

return servers

