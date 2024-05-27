return {
	-- using packer.nvim
	{
		'nmac427/guess-indent.nvim',
		lazy = true,
		event = "BufRead",
		opts = {
			filetype_exclude = {
				"netrw",
				"tutor",
			},
			buftype_exluce = {
				"help",
				"nofile",
				"mason",
				"terminal",
				"prompt",
			}
		},
	}
}
