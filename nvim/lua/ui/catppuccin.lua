require("catppuccin").setup({ 
        compile = { 
          enabled = true, 
          path = vim.fn.stdpath "cache" .. "/catppuccin",
          suffix = "_compiled"
        },
        styles = { 
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = { 
          lsp_trouble = true,
        }
})

