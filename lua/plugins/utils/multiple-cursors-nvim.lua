-- if true then
--   return {}
-- end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    'brenton-leighton/multiple-cursors.nvim',
    lazy = true,
    event = 'VeryLazy',
    keys = nil,
    opts = function(_, opts)
      local wk = require 'which-key'
      wk.add {
        { '<leader>m', group = '󱢓 Multiple cursors' },
        { '<leader>ma', '<Cmd>MultipleCursorsAddMatches<CR>', desc = 'Add Matches' }, -- f = { "<cmd>Telescope find_files<cr>", "Find File" },
        { '<leader>mA', '<Cmd>MultipleCursorsAddMatchesV<CR>', desc = 'Add Matches (Limited by Visual Area)' },
        { '<leader>mj', '<Cmd>MultipleCursorsAddJumpNextMatch<CR>', desc = 'Jump Next Add Match' },
        { '<leader>mn', '<Cmd>MultipleCursorsJumpNextMatch<CR>', desc = 'Jump Next Match' },
        { '<leader>mt', '<Cmd>MultipleCursorsLockToggle<CR>', desc = 'Toggle Lock or Unlock Multiple Cursors' },
      }
      wk.add {
        mode = { 'i', 'n' },
        { '<C-n>',         '<Cmd>MultipleCursorsAddDown<CR>',        desc = 'Add Multiple Cursors Down' },
        -- ['<C-m>'] = {
        --   '<Cmd>MultipleCursorsAddUp<CR>',
        --   'Add Multiple Cursors Up',
        -- },
        { '<C-LeftMouse>', '<Cmd>MultipleCursorsMouseAddDelete<CR>', desc = 'Add Multiple Cursors with Mouse' },
      }
      return opts
    end,
  },
}
