-- vim.fn.setenv("PYENV_ROOT", "$HOME/.virtualenvs/neovim/bin/activate")
return {
  {
    'linux-cultist/venv-selector.nvim',
    lazy = true,
    event = 'BufEnter *.py',
    branch = 'regexp',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap-python',
    },
    opts = function(_, opts)
      opts.auto_refresh = true
      vim.keymap.set('n', '<leader>lv', '<Cmd>VenvSelect<CR>', { desc = 'Select VirtualEnv' })
      vim.keymap.set('n', '<leader>lV', '<Cmd>VenvSelectCached<CR>', { desc = 'Select VirtualEnv (cache)' })
    end,
    cmd = { 'VenvSelect', 'VenvSelectCached' },
  },
  {
    'mfussenegger/nvim-dap-python',
    dependencies = 'mfussenegger/nvim-dap',
    ft = 'python', -- NOTE: ft: lazy-load on filetype
    config = function(_, opts)
      require('dap-python').setup("python3", opts)
    end,
  },
  {
    'nvim-neotest/neotest',
    optional = true,
    dependencies = { 'nvim-neotest/neotest-python' },
    opts = function(_, opts)
      if not opts.adapters then
        opts.adapters = {}
      end
      opts.adapters = { require 'neotest-python' }
    end,
  },
}
