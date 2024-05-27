return {
  {
    'folke/neodev.nvim',
    lazy = true,
    event = 'BufRead *.lua',
    opts = {
      -- override = function(root_dir, library)
      -- 	if root_dir:find("~/.config/vim", 1, true) == 1 then
      -- 		library.enabled = true
      -- 		library.plugins = true
      -- 	end
      -- end,
    },
  },
}
