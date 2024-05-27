vim.opt.wrap = false
-- vim.opt.linebreak = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.opt.statuscolumn = "%s %l %r"
-- vim.opt.relculrigth = true
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false


-- vim.opt.nostartofline = true
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- Decrease update time
vim.opt.updatetime = 250
-- vim.api.nvim_set_keymap('i', '<C-Right>', '<Esc>ea', {})

-- Configure how new splits should be opened
-- vim.opt.splitright = true
-- vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
-- vim.opt.inccommand = 'split'
--
-- Update on insert lsp
-- vim.diagnostic.Opts {
--   update_in_insert = true,
-- }
vim.diagnostic.config {
  update_in_insert = true,
}

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Global statusline
vim.opt.laststatus = 3
-- Assuming 'config' is a table representing your configuration settings
vim.api.nvim_command 'highlight WinSeparator none'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 2

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.opt.incsearch = false
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.wo.number = true

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Make Neovim remember the cursor position when reopening files
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    -- Check if the file is valid
    if vim.fn.line '\'"' > 0 and vim.fn.line '\'"' <= vim.fn.line '$' then
      -- Restore the cursor position
      vim.api.nvim_command 'normal! g`"'
    end
  end,
})

-- Split config
--
vim.api.nvim_set_keymap('n', '|', '<cmd>vsplit<cr>', { desc = 'Vertical Split' })
vim.api.nvim_set_keymap('n', '\\', '<cmd>split<cr>', { desc = 'Horizontal Split' })
