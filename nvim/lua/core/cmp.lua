local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')


cmp.setup({ 
  formating = {
    fields = { "kind", "abrr"},
    format = { function(_, vim_item)
      vim_item.kind = cmp_kinds[vim_item.kind] or ""
      return vim_item
    end,
    },
  },
  snippet = {
    expand= function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }), 


    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

  },
  experimental = {
    ghost_text = true,
  },
  sources = {
    { name = 'nvim_lsp' }, 
    { name = 'luasnip'  },
  }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Needed plugins: nvim_lsp; cmp-nvim-lsp-document-symbol; nvim-lsp-signature-help; cmp-path; cmp-cmdline-history; 
-- ; fuzzy_path


