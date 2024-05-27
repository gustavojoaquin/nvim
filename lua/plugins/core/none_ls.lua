return {
  'nvimtools/none-ls.nvim',
  lazy = true,
  event = 'BufRead',
  opts = function(_, opts)
    opts.debug = true
    -- local null_ls = require 'null-ls'
    -- opts.sources = {
    -- 	null_ls.builtins.completion.spell,
    -- }
  end,
}
