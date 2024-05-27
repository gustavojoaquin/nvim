return {
	'lewis6991/gitsigns.nvim',
	lazy = true,
	event = 'BufRead',
	opts = function(_, opts)
		local wk = require 'which-key'
		wk.register { {
			['<leader>g'] = { name = '󰊢  GitSigns' },
		}, { mode = { 'v', 'n' } } }
		opts.on_attach = function(bufnr)
			local gitsigns = require 'gitsigns'

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map('n', ']c', function()
				if vim.wo.diff then
					vim.cmd.normal { ']c', bang = true }
				else
					gitsigns.nav_hunk 'next'
				end
			end)

			map('n', '[c', function()
				if vim.wo.diff then
					vim.cmd.normal { '[c', bang = true }
				else
					gitsigns.nav_hunk 'prev'
				end
			end)

			-- Actions
			map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
			map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Reset hunk' })
			map('v', '<leader>gs', function()
				gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
			end, { desc = 'Stage hunk' })
			map('v', '<leader>gr', function()
				gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
			end, { desc = 'Reset hunk' })
			map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
			map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Undo stage hunk' })
			map('n', '<leader>ga', gitsigns.reset_buffer, { desc = 'Reset buffer' })
			map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
			map('n', '<leader>gb', function()
				gitsigns.blame_line { full = true }
			end, { desc = 'Blame line' })
			map('n', '<leader>gc', gitsigns.toggle_current_line_blame, { desc = 'Toggle line blame' })
			map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Diff this' })
			map('n', '<leader>gD', function()
				gitsigns.diffthis '~'
			end, { desc = 'Diff this ~' })
			map('n', '<leader>gt', gitsigns.toggle_deleted, { desc = 'Toggle deleted' })

			-- Text object
			map({ 'o', 'x' }, 'gh', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'GitSigns select hunk' })
		end
	end,
}
