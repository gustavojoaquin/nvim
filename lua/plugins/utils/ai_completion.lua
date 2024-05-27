return {
	{
		'tzachar/cmp-tabnine',
		as = 'cmp_tabnine',
		build = './install.sh',
		-- dependencies = "hrsh7th/nvim-cmp",
		lazy = true,
		event = 'BufRead',
		config = function()
			require('cmp_tabnine.config'):setup {
				max_lines = 1000,
				max_num_results = 30,
				sort = true,
				run_on_every_keystroke = true,
				snippet_placeholder = '🚀',
				ignored_file_types = {
					-- default is not to ignore
					-- uncomment to ignore in lua:
					-- lua = true
				},
				show_prediction_strength = false,
			}
		end,
	},
	{
		'Exafunction/codeium.nvim',
		lazy = true,
		event = 'BufRead',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'hrsh7th/nvim-cmp',
		},
		config = function()
			local opts = {}
			opts.enable_chat = true
			opts.multiline_completions = true

			require('codeium').setup(opts)
		end,
	},
}
