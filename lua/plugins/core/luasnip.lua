return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip',
    },
    lazy = true,
    opts = function(_, opts)
      require('luasnip.loaders.from_vscode').lazy_load {}
    end,
  },
}
