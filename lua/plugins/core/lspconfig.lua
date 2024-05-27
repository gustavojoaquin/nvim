return {
  {
    'neovim/nvim-lspconfig',
    dependencies = "VonHeikemen/lsp-zero.nvim",
    lazy = true,
    event = 'BufRead',
    config = function()
      require('which-key').register({
        ['<leader>'] = {
          l = {
            name = '  Lsp configurations',
            i = { '<cmd>LspInfo<cr>', 'Lsp Info' },
          },
        },
      }, { mode = { 'n', 'v' } })
    end,
  },
}
