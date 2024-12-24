vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10

-- tabstop
vim.o.tabstop = 2
-- vim.o.softtabstop=4
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- keymap
-- for specific configuration of certain file types, check <filetype>.lua file in /after/ftplugin/ directory.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- auto command
--
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
-- 	pattern = "*.cs",
-- 	callback = function()
-- 		vim.bo.filetype = "c_sharp"
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { 'json', 'lua', 'cs', 'c_sharp', 'js', 'ts', 'markdown' }, -- You can add more filetypes here later
	callback = function()
		-- vim.opt_local.foldmethod = 'syntax'
		vim.opt.foldenable = true
		-- vim.opt.foldlevelstart = 99
		local filetype = vim.bo.filetype
		if filetype == "cs" or filetype == "csharp" then
			filetype = "c_sharp"
		end

		if require("nvim-treesitter.parsers").has_parser(filetype) then
			print("parser " .. filetype)
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		else
			print("noparser " .. filetype)
			vim.opt.foldmethod = "syntax"
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = { '*.json', '*.jsonc', '*.js', '*.ts', '*.cs', '*.lua', '*.md' },
	callback = function()
		vim.lsp.buf.format { async = false }
	end,
})

require("config.terminal")
