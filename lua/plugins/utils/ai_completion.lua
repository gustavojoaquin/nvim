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
	-- add this to the file where you setup your other plugins:
	-- {
	-- 	"monkoose/neocodeium",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		local neocodeium = require("neocodeium")
	-- 		neocodeium.setup()
	-- 		vim.keymap.set("i", "<A-f>", neocodeium.accept)
	-- 		vim.keymap.set("i", "<A-w>", function()
	-- 			require("neocodeium").accept_word()
	-- 		end)
	-- 		vim.keymap.set("i", "<A-a>", function()
	-- 			require("neocodeium").accept_line()
	-- 		end)
	-- 		vim.keymap.set("i", "<A-e>", function()
	-- 			require("neocodeium").cycle_or_complete()
	-- 		end)
	-- 		vim.keymap.set("i", "<A-r>", function()
	-- 			require("neocodeium").cycle_or_complete(-1)
	-- 		end)
	-- 		vim.keymap.set("i", "<A-x>", function()
	-- 			require("neocodeium").clear()
	-- 		end)
	-- 	end,
	-- },
	{
		"magicalne/nvim.ai",
		lazy = true,
		event = "BufRead",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			provider = "gemini",
			gemini = {
				model = "gemini-1.5-pro-exp-0827" -- This is optional, the default config uses flash.
			},
		}
	},
}
