return {
	-- {
	-- 	'tzachar/cmp-tabnine',
	-- 	as = 'cmp_tabnine',
	-- 	build = './install.sh',
	-- 	-- dependencies = "hrsh7th/nvim-cmp",
	-- 	lazy = true,
	-- 	event = 'BufRead',
	-- 	config = function()
	-- 		require('cmp_tabnine.config'):setup {
	-- 			max_lines = 1000,
	-- 			max_num_results = 30,
	-- 			sort = true,
	-- 			run_on_every_keystroke = true,
	-- 			snippet_placeholder = '🚀',
	-- 			ignored_file_types = {
	-- 				-- default is not to ignore
	-- 				-- uncomment to ignore in lua:
	-- 				-- lua = true
	-- 			},
	-- 			show_prediction_strength = false,
	-- 		}
	-- 	end,
	-- },
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
	{
		"yetone/avante.nvim",
		build = function()
			return "make BUILD_FROM_SOURCE=true"
		end,
		event = "VeryLazy",
		version = false,
		---@module 'avante'
		---@type avante.Config
		opts = {
			provider = "deepseek",
			providers = {
				deepseek = {
					__inherited_from = "openai",
					api_key_name = "DEEPSEEK_API_KEY",
					endpoint = "https://api.deepseek.com",
					model = "deepseek-coder",
					extra_request_body = {
            temperature = 0.4,
          },
				},
			},
			web_search_engine = {
					enable = true,
				provider = "tavily",
				proxy = nil,
			}
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp",           -- autocompletion for avante commands and mentions
			"folke/snacks.nvim",          -- for input provider snacks
			'MeanderingProgrammer/render-markdown.nvim',
		},
	}
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
	-- {
	-- 	"magicalne/nvim.ai",
	-- 	lazy = true,
	-- 	event = "BufRead",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	opts = {
	-- 		provider = "gemini",
	-- 		gemini = {
	-- 			model = "gemini-1.5-pro-exp-0827" -- This is optional, the default config uses flash.
	-- 		},
	-- 	}
	-- },
}
