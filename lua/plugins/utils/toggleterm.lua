return {
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		lazy = true,
		event = 'VeryLazy',
		config = function()
			require('toggleterm').setup {
				persist_mode = false,
			}
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
				vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
				vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
				-- vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
			local wk = require 'which-key'

			wk.add {
				mode = { 'v', 'n' },
				{ '<leader>t', group = '  Toggleterm' },
				{ '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle Terminal' },
				{ '<leader>tg', '<cmd>TermExec cmd=lazygit direction=float<cr>', desc = 'Lazygit' },
				{ '<leader>tb', '<cmd>TermExec cmd=btm direction=float<cr>', desc = 'Bottom' },
			}
		end,
	},
}
