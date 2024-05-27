return {
  {
    'romgrk/barbar.nvim',
    lazy = true,
    event = 'BufRead',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    version = '*',                   -- optional: only update when a new 1.x version is released
    init = function()
      vim.g.barbar_auto_setup = false
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true, desc = '' }

      -- Move to previous/next
      map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
      map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
      -- Re-order to previous/next
      map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
      map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
      -- Goto buffer in position...
      map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
      map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
      map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
      map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
      map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
      map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
      map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
      map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
      map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
      map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
      -- Pin/unpin buffer
      map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
      -- Close buffer
      map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
      -- Wipeout buffer
      --                 :BufferWipeout
      -- Close commands
      --                 :BufferCloseAllButCurrent
      --                 :BufferCloseAllButPinned
      --                 :BufferCloseAllButCurrentOrPinned
      --                 :BufferCloseBuffersLeft
      --                 :BufferCloseBuffersRight
    end,
    opts = function(_, opts)
      opts.animation = true
      opts.insert_at_start = true
      opts.icons = {
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = ' ' },
          [vim.diagnostic.severity.WARN] = { enabled = true },
          [vim.diagnostic.severity.INFO] = { enabled = true },
          [vim.diagnostic.severity.HINT] = { enabled = true },
        },
      }

      local wk = require 'which-key'
      wk.register({
        ['<leader>b'] = {
          name = ' Buffer',
        },
      }, { mode = { 'n' } })
      local opt = { noremap = true, silent = true, desc = '' }

      -- Magic buffer-picking mode
      vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>BufferPick<CR>', opt)
      -- Sort automatically by...
      vim.keymap.set('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>',
        vim.tbl_extend('force', opt, { desc = 'Sort by buffer number' }))
      vim.keymap.set('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>',
        vim.tbl_extend('force', opt, { desc = 'Sort by buffer name' }))
      vim.keymap.set('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>',
        vim.tbl_extend('force', opt, { desc = 'Sort by directory' }))
      vim.keymap.set('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>',
        vim.tbl_extend('force', opt, { desc = 'Sort by language' }))
      vim.keymap.set('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>',
        vim.tbl_extend('force', opt, { desc = 'Sort by window number' }))                                                                       -- Other:
      -- :BarbarEnable - enables barbar (enabled by default)
      -- :BarbarDisable - very bad command, should never be used

      -- vim.api.nvim_set_keymap('n', '<leader><', '<cmd>BufferPrevious<cr>', { desc = 'Move Next Buffer' })
      -- vim.api.nvim_set_keymap('n', '<leader>>', '<cmd>BufferNext<cr>', { desc = 'Move Next Buffer' })
      -- …etc.
    end,
  },
}
