return {
  'mrjones2014/smart-splits.nvim',
  event = 'VeryLazy', -- load on very lazy for mux detection
  opts = function(_, opts)
    local wk = require 'which-key'
    wk.register({
      ['<C-H>'] = {
        function()
          require('smart-splits').move_cursor_left()
        end,
        'Move to left split',
      },
      ['<C-J>'] = {
        function()
          require('smart-splits').move_cursor_down()
        end,
        'Move to below split',
      },
      ['<C-K>'] = {
        function()
          require('smart-splits').move_cursor_up()
        end,
        'Move to above split',
      },
      ['<C-L>'] = {
        function()
          require('smart-splits').move_cursor_right()
        end,
        'Move to right split',
      },
      ['<C-Up>'] = {
        function()
          require('smart-splits').resize_up()
        end,
        'Resize split up',
      },
      ['<C-Down>'] = {
        function()
          require('smart-splits').resize_down()
        end,
        'Resize split down',
      },
      ['<C-Left>'] = {
        function()
          require('smart-splits').resize_left()
        end,
        'Resize split left',
      },
      ['<C-Right>'] = {
        function()
          require('smart-splits').resize_right()
        end,
        'Resize split right',
      },
    }, { mode = { 'n' } })
    opts.ignored_filetypes = { 'nofile', 'quickfix', 'qf', 'prompt' }
    opts.ignored_buftypes = { 'nofile' }
  end,
}
