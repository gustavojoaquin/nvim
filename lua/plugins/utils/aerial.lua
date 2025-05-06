return {
	'stevearc/aerial.nvim',
	lazy = true,
	event = 'BufRead',
	-- Optional dependencies
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
		'nvim-tree/nvim-web-devicons',
	},
	opts = function(_, opts)
		opts.backends = { 'lsp', 'treesitter', 'markdown', 'asciidoc', 'man' }
		opts.attach_mode = 'global'
		opts.layout = { min_width = 28 }
		opts.show_guides = true
		opts.filter_kind = false
		opts.guides = {
			mid_item = '├ ',
			last_item = '└ ',
			nested_top = '│ ',
			whitespace = '  ',
		}
		local wk = require 'which-key'
		wk.add({
			{
				{ '<leader>a', group = '  Aerial' },
				{
					'<leader>aa',
					'<cmd>AerialToggle!<cr>',
					desc = 'Toggle Aerial',
				},
			},
		}, { mode = { 'n' } })

		opts.on_attach = function(bufnr)
			-- Jump forwards/backwards with '{' and '}'
			vim.keymap.set('n', '<leader>ap', '<cmd>AerialPrev<CR>', { buffer = bufnr })
			vim.keymap.set('n', '<leader>an', '<cmd>AerialNext<CR>', { buffer = bufnr })
		end
	end,
}
