-- vim.fn.setenv("PYENV_ROOT", "$HOME/.virtualenvs/neovim/bin/activate")
return {
  {
    'linux-cultist/venv-selector.nvim',
    event = 'BufRead *.py',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap-python',
    },
    opts = function(_, opts)
      vim.keymap.set('n', '<leader>lv', '<Cmd>VenvSelect<CR>', { desc = 'Select VirtualEnv' })
    end,
    cmd = { 'VenvSelect', 'VenvSelectCached' },
  },
  {
    'mfussenegger/nvim-dap-python',
    dependencies = 'mfussenegger/nvim-dap',
    ft = 'python', -- NOTE: ft: lazy-load on filetype
    config = function(_, opts)
      local path = require('mason-registry').get_package('debugpy'):get_install_path()
      if vim.fn.has 'win32' == 1 then
        path = path .. '/venv/Scripts/python'
      else
        path = path .. '/venv/bin/python'
      end
      require('dap-python').setup(path, opts)
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
