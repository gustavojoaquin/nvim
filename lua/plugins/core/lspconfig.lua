return {
  'neovim/nvim-lspconfig',
  dependencies = 'VonHeikemen/lsp-zero.nvim',
  lazy = true,
  event = 'BufRead',
  config = function()
    require('which-key').add {
      mode = { 'n', 'v' },
      { '<leader>l', group = '  Lsp configurations' },
      { '<leader>li', '<cmd>LspInfo<cr>', desc = 'Lsp Info' },
    }
  end,
}
