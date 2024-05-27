return {
	{
		"windwp/nvim-ts-autotag",
		lazy = true,
		event = "InsertEnter",
		opts = {
			opts = {
				enable_close_on_slash = true,
			}
		}

	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	}
}
