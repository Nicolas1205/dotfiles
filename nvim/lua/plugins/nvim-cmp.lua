local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then 
  return 
end 

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then 
  return 
end


local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm-done' , cmp_autopairs.on_confirm_done({ map_char = {tex = ''}}))
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"


local function border(hl_name)
  return { 
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end


local options = { 

  window = { 
    completion = { 
      border = border "CmpBorder",
    },
    documentation = { 
      border = border "CmpDocBorder",
    },
  },

  
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  completion = { 
    completeopt = 'menu,menuone,noselect',
    keyword_length = 2
  },

  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },

  sources = {
    { name = 'nvim_lsp'}, 
    {name = 'luasnip'}, 
    {name = 'path'}, 
    {name = 'buffer'}, 
  },

  experimental = { 
    ghost_text = true,
  },

  completion = { 
    completeopt = "menu,menuone,noinsert", 
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 0, 
  }

}

cmp.setup(options)

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", { 
  mapping = cmp.mapping.preset.cmdline(), 
  sources = cmp.config.sources({ 
      { name = "path" }, 
    }, { 
      {name =  "cmdline" }, 
    }),  
})
