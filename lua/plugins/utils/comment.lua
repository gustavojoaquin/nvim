return {
	-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
	{
		'numToStr/Comment.nvim',
		lazy = true,
		event = "BufRead",
		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true, opts = { enable_autocmd = false } },
		},
		opts = function(_, opts)
			-- add any options here
		end,
	}
}
