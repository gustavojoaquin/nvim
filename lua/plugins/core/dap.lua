return {
  {
    'rcarriga/nvim-dap-ui',
    lazy = true,
    event = 'VeryLazy',
    dependencies = { 'mfussenegger/nvim-dap', { 'nvim-neotest/nvim-nio', lazy = true } },

    config = function()
      require('dapui').setup()

      local dap, dapui = require 'dap', require 'dapui'
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    event = 'VeryLazy',
    config = function()
      local wk = require 'which-key'
      wk.add {
        mode = { 'v', 'n' },
        { '<leader>d', group = '  Debugger' },
      }

      local dap = require 'dap'
      vim.keymap.set('n', '<leader>dc', function()
        dap.continue()
      end, { desc = 'DAP Continue' })
      vim.keymap.set('n', '<leader>ds', function()
        dap.step_over()
      end, { desc = 'DAP Step Over' })
      vim.keymap.set('n', '<leader>di', function()
        dap.step_into()
      end, { desc = 'DAP Step Into' })
      vim.keymap.set('n', '<leader>do', function()
        dap.step_out()
      end, { desc = 'DAP Step Out' })
      vim.keymap.set('n', '<leader>dt', function()
        dap.toggle_breakpoint()
      end, { desc = 'DAP Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>db', function()
        dap.set_breakpoint()
      end, { desc = 'DAP Set Breakpoint' })
      vim.keymap.set('n', '<leader>dS', function()
        dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
      end, { desc = 'DAP Set Logpoint' })
      vim.keymap.set('n', '<leader>dr', function()
        dap.repl.open()
      end, { desc = 'DAP Open REPL' })
      vim.keymap.set('n', '<Lleader>dl', function()
        dap.run_last()
      end, { desc = 'DAP Run Last' })
      vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
      end, { desc = 'DAP Hover' })
      vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
      end, { desc = 'DAP Preview' })
      vim.keymap.set('n', '<Leader>df', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.frames)
      end, { desc = 'DAP Frames' })
      vim.keymap.set('n', '<Leader>dw', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.scopes)
      end, { desc = 'DAP Scopes' })
    end,
  },
}
