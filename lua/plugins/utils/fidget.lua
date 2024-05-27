return {
	{
		"j-hui/fidget.nvim",
		lazy = true,
		event = "BufRead",
		-- tag = "v*", -- Make sure to update this to something recent!
		opts = {
			notification = {
				override_vim_notify = false,
			}
			-- options
		},
	}
}
