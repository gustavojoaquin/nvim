return {
  {
    'leoluz/nvim-dap-go',
    ft = 'go',
    dependencies = {
      'mfussenegger/nvim-dap',
      'jay-babu/mason-nvim-dap.nvim',
    },
    opts = {},
  },
  {
    'ray-x/go.nvim',
    lazy = true,
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      disable_defaults = true,
    },
    -- event = { "CmdlineEnter" },
    -- event = { "BufRead *.go *.mod" },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()',
  },
  {
    'nvim-neotest/neotest',
    optional = true,
    dependencies = { 'nvim-neotest/neotest-go' },
    opts = function(_, opts)
      if not opts.adapters then
        opts.adapters = {}
      end
    end,
  },
}
