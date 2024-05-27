return {
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		lazy = true,
		event = 'VeryLazy',
		build =
		'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = function()
			require('telescope').load_extension 'fzf'
		end,
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		event = 'VeryLazy',
		lazy = true,
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = function()
			require("telescope").load_extension("ui-select")
		end,
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		lazy = true,
		event = 'VeryLazy',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = function(_, opts)
			local builtin = require 'telescope.builtin'
			local wk = require 'which-key'
			-- local trouble = require 'trouble.providers.telescope'

			opts.extensions = {
				fzf = {
					fuzzy = true,              -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = 'smart_case',  -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown {
						-- even more opts
					}

				}
			}

			wk.register {
				['<leader>'] = {
					f = {
						name = ' Find',
						f = { builtin.find_files, 'Find Files' },
						r = { builtin.oldfiles, 'Open Recent File' },
						g = { builtin.live_grep, 'Live words' },
						b = { builtin.buffers, 'Find buffers' },
						h = { builtin.help_tags, 'Find tags' },
						c = { builtin.commands, 'Find commands' },
						t = { builtin.treesitter, 'List treesitter' },
						m = { builtin.man_pages, 'Finds manuals' },
						q = { builtin.quickfix, 'List quickfix' },
						Q = { builtin.quickfix_history, 'List quickfix history' },

						x = { require('trouble.providers.telescope').open_with_trouble, 'Search Troubles' },
					},
				},
			}
		end,
	},
}
