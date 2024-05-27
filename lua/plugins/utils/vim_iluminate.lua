return {
  {
    'RRethy/vim-illuminate',
    lazy = true,
    event = 'BufRead',
    init = function()
      vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
        pattern = { '*' },
        callback = function(ev)
          vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'Visual' })
          vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })
          vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'Visual' })
        end,
      })
    end,
    config = function()
      local opts = {}
      opts.delay = 200
      opts.min_count_to_highlight = 2
      opts.large_file_overrides = { providers = { 'lsp' } }
      require('illuminate').configure(opts)
    end,
  },
}
