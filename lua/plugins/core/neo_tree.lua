return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    lazy = true,
    event = 'VeryLazy',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim',              -- Optional image support in preview window: See `# Preview Mode` for more information
      's1n7ax/nvim-window-picker',
    },

    opts = function(_, opts)
      local wk = require 'which-key'
      local mappings = {
        {
          ['<leader>'] = {
            e = { '<cmd>Neotree toggle<cr>', 'Toggle Explorer' },
            o = {
              function()
                if vim.bo.filetype == 'neo-tree' then
                  vim.cmd.wincmd 'p'
                else
                  vim.cmd.Neotree 'focus'
                end
              end,
              'Toggle Explorer Focus',
            },
          },
        },
        { mode = { 'v', 'n' } },
      }
      wk.register(mappings)

      opts.enable_git_status = true
      opts.enable_diagnostics = true
      opts.filesystem = {
        follow_current_file = {
          enabled = true,          -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        use_libuv_file_watcher = true,
        group_empty_dirs = true,
      }
      opts.sources = {
        'filesystem',
        'buffers',
        'git_status',
        'document_symbols',
      }
      opts.buffers = {
        follow_current_file = {
          enabled = true,          -- This will find and focus the file in the active buffer every time
          --              -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      }
      opts.git_status = {
        window = {
          position = 'float',
        },
      }
      opts.window = {
        position = 'left',
        width = 25,
      }
      opts.source_selector = {
        winbar = true,
        statusline = false,
      }
    end,
  },
}
