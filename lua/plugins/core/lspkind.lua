return {
  {
    'onsails/lspkind.nvim',
    lazy = true,
    -- event = 'VeryLazy',
    enabled = vim.g.icons_enabled ~= false,
    config = function()
      local opts = {
        mode = 'symbol',
        symbol_map = {
          Array = '󰅪',
          Boolean = '⊨',
          Class = '󰌗',
          Constructor = '',
          Key = '󰌆',
          Namespace = '󰅪',
          Null = 'NULL',
          Number = '#',
          Object = '󰀚',
          Package = '󰏗',
          Property = '',
          Reference = '',
          Snippet = '',
          String = '󰀬',
          TypeParameter = '󰊄',
          Unit = '',
        },
        menu = {},
      }
      require('lspkind').init(opts)
    end,
  },
}
