return {
  'neovim/nvim-lspconfig',
  dependencies = {'VonHeikemen/lsp-zero.nvim', 'williamboman/mason-lspconfig.nvim'},
  lazy = true,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = function()
    require('which-key').add {
      mode = { 'n', 'v' },
      { '<leader>l', group = '  Lsp configurations' },
      { '<leader>li', '<cmd>LspInfo<cr>', desc = 'Lsp Info' },
    }
  end,
}
