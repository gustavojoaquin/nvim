return {
	'aznhe21/actions-preview.nvim',
	lazy = true,
	opts = function(_, opts)
		opts.telescope = {
			sorting_strategy = 'ascending',
			layout_strategy = 'vertical',
			layout_config = {
				width = 0.7,
				height = 0.8,
				prompt_position = 'top',
				preview_cutoff = 20,
				preview_height = function(_, _, max_lines)
					return max_lines - 25
				end,
			},
		}
	end,
}
