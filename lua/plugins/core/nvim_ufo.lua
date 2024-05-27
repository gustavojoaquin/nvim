return {
  'kevinhwang91/nvim-ufo',
  lazy = true,
  event = 'BufRead',
  dependencies = { 'kevinhwang91/promise-async' },
  init = function()
    vim.o.foldcolumn = 'auto'
    vim.o.foldlevel = 99 -- Using ufo provider need a large value
    vim.o.foldlevelstart = 99
    vim.o.foldnestmax = 0
    vim.o.foldenable = true
    vim.o.foldmethod = 'indent'

    vim.opt.fillchars = {
      fold = ' ',
      foldopen = '',
      foldsep = ' ',
      foldclose = '',
      stl = ' ',
      eob = ' ',
    }
  end,
  opts = function(_, opts)
    -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })

    opts.provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end
  end,
}
