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
      wk.register({
        ['<leader>'] = {
          m = {
            name = '󱢓 Multiple cursors',
            a = { '<Cmd>MultipleCursorsAddMatches<CR>', 'Add Matches' }, -- f = { "<cmd>Telescope find_files<cr>", "Find File" },
            A = { '<Cmd>MultipleCursorsAddMatchesV<CR>', 'Add Matches (Limited by Visual Area)' },
            j = { '<Cmd>MultipleCursorsAddJumpNextMatch<CR>', 'Jump Next Add Match' },
            n = { '<Cmd>MultipleCursorsJumpNextMatch<CR>', 'Jump Next Match' },
            t = { '<Cmd>MultipleCursorsLockToggle<CR>', 'Toggle Lock or Unlock Multiple Cursors' },
          },
        },
      }, { mode = { 'n', 'v' } })
      wk.register({
        ['<C-n>'] = {
          '<Cmd>MultipleCursorsAddDown<CR>',
          'Add Multiple Cursors Down',
        },
        -- ['<C-m>'] = {
        --   '<Cmd>MultipleCursorsAddUp<CR>',
        --   'Add Multiple Cursors Up',
        -- },
        ['<C-LeftMouse>'] = {
          '<Cmd>MultipleCursorsMouseAddDelete<CR>',
          'Add Multiple Cursors with Mouse',
        },
      }, { mode = { 'n', 'i' } })
      return opts
    end,
  },
}
