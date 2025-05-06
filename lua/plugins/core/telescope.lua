return {
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		event = "VeryLazy",
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = function()
			require('telescope').load_extension("fzf")
		end
	},
	-- {
	-- 	'nvim-telescope/telescope-fzf-native.nvim',
	-- 	lazy = true,
	-- 	event = 'VeryLazy',
	-- 	build =
	-- 	'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
	-- 	dependencies = { 'nvim-telescope/telescope.nvim' },
	-- 	config = function()
	-- 		require('telescope').load_extension 'fzf'
	-- 	end,
	-- },
	{
		'nvim-telescope/telescope-ui-select.nvim',
		event = 'VeryLazy',
		lazy = true,
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = function()
			require('telescope').load_extension 'ui-select'
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		lazy = true,
		event = 'VeryLazy',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = function(_, opts)
			local builtin = require 'telescope.builtin'
			local wk = require 'which-key'
			local open_with_trouble = require('trouble.sources.telescope').open
			-- local trouble = require 'trouble.providers.telescope'
			-- require('telescope').load_extension 'fzf'

			opts.extensions = {
				fzf = {
					fuzzy = true,              -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = 'smart_case',  -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				['ui-select'] = {
					require('telescope.themes').get_dropdown {
						-- even more opts
					},
				},
			}

			wk.add {
				{ '<leader>f',  group = 'Find' },
				{ '<leader>ff', builtin.find_files,       desc = 'Find Files' },
				{ '<leader>fr', builtin.oldfiles,         desc = 'Open Recent File' },
				{ '<leader>fg', builtin.live_grep,        desc = 'Live words' },
				{ '<leader>fb', builtin.buffers,          desc = 'Find buffers' },
				{ '<leader>fh', builtin.help_tags,        desc = 'Find tags' },
				{ '<leader>fc', builtin.commands,         desc = 'Find commands' },
				{ '<leader>ft', builtin.treesitter,       desc = 'List treesitter' },
				{ '<leader>fm', builtin.man_pages,        desc = 'Finds manuals' },
				{ '<leader>fq', builtin.quickfix,         desc = 'List quickfix' },
				{ '<leader>fQ', builtin.quickfix_history, desc = 'List quickfix history' },

				{
					'<leader>fx',
					open_with_trouble,
					desc = 'Search Troubles',
				},
			}
		end,
	},
}
