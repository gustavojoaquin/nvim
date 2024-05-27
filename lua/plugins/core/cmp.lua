local source_mapping = {
  buffer = '[Buffer]',
  nvim_lsp = '[LSP]',
  nvim_lua = '[Lua]',
  cmp_tabnine = '[TN]',
  path = '[Path]',
  otter = '[Otter]',
  codeium = '[CI]',
  luasnip = '[LUS]',
}

return {

  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = 'InsertEnter',
    dependencies = {
      { 'onsails/lspkind.nvim', lazy = true },
      { 'hrsh7th/cmp-nvim-lsp', lazy = true },
      { 'hrsh7th/cmp-cmdline',  lazy = true },
      { 'hrsh7th/cmp-buffer',   lazy = true },
      { 'hrsh7th/cmp-path',     lazy = true },
      { 'hrsh7th/cmp-cmdline',  lazy = true },
      { 'hrsh7th/cmp-emoji',    lazy = true },
    },
    opts = function(_, opts)
      local lspkind = require 'lspkind'
      local cmp = require 'cmp'
      local cmp_action = require('lsp-zero').cmp_action()
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

      -- opts.completion = { autocomplete = true }
      opts.mapping = cmp.mapping.preset.insert {
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<CR>'] = cmp.mapping.confirm { select = false },
        -- scroll up and down the documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        -- Enable Super Tab
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
        -- -- Invoke menu manually
        ['<C-Space>'] = cmp.mapping.complete(),
      }

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.sources = cmp.config.sources {
        { name = 'cmp_tabnine', priority = 750 },
        { name = 'nvim_lsp',    priority = 1000 },
        { name = 'luasnip',     priority = 900 },
        { name = 'buffer',      priority = 800 },
        { name = 'path',        priority = 700 },
        { name = 'emoji',       priority = 650 },
        { name = 'otter',       priority = 850 },
        { name = 'codeium',     priority = 825 },
      }
      opts.formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          -- if you have lspkind installed, you can use it like
          -- in the following line:
          vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = 'symbol_text' })
          vim_item.menu = source_mapping[entry.source.name]
          if entry.source.name == 'cmp_tabnine' then
            local detail = (entry.completion_item.data or {}).detail
            vim_item.kind = ' Tabnine'
            -- vim.api.nvim_set_hl(0, 'TabnineHighlight', { bg='#04b31b', fg='#04b31b' })
            if detail and detail:find '.*%%.*' then
              vim_item.kind = vim_item.kind .. ' ' .. detail
            end
            if (entry.completion_item.data or {}).multiline then
              vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
            end
          end
          if entry.source.name == 'codeium' then
            local detail = (entry.completion_item.data or {}).detail
            vim_item.kind = ' Codeium'
            -- vim.api.nvim_set_hl(0, 'TabnineHighlight', { bg='#04b31b', fg='#04b31b' })
            if detail and detail:find '.*%%.*' then
              vim_item.kind = vim_item.kind .. ' ' .. detail
            end
            if (entry.completion_item.data or {}).multiline then
              vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
            end
          end
          local maxwidth = 40
          vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
          return vim_item
        end,
        -- format = lspkind_status_ok and lspkind.cmp_format(astronvim.lspkind) or nil,
      }
      opts.snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      }
    end,
  },
}
