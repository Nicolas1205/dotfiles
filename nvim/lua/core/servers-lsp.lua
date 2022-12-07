local servers = {
  clangd = {
    cmd = {
      'clangd15',
      '--clang-tidy',
      '--completion-style=bundled',
      '--header-insertion=iwyu',
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

