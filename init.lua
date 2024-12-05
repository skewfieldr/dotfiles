print("hello fuckers")

require('config')

-- keymap
vim.g.mapleader = ' '

vim.g.maplocalleader = ' '
vim.o.tabstop=4
-- vim.o.softtabstop=4
vim.o.shiftwidth=4

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd({'FileType'}, {
	pattern = { 'json', 'go', 'lua' },
	callback = function()
		vim.opt_local.foldmethod = 'syntax'
		vim.opt.foldenable = true
	end
})

-- NOTE: Lazy Setup

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'

	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require('lazy').setup({
	require('plugins.todocomments'),
	require('plugins.web-devicons'),
	require('plugins.telescope'),
	require('plugins.nvimtree'),
	require('plugins.harpoon'),
	require('plugins.which-key'),
	require('plugins.treesitter'),
	require('plugins.lsp'),
	require('plugins.lsp.autocompletion'),
	require('plugins.tokyonight'),
	require('plugins.autoformat'),
})
