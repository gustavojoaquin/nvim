return {
  {
    'Bekaboo/dropbar.nvim',
    lazy = true,
    event = 'BufRead',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
    },
		opts = {},
  },
}
