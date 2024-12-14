return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.
	init = function()
		vim.cmd.colorscheme("tokyonight")

		vim.cmd.hi("Comment gui=none")
		vim.cmd.hi("Normal guibg=none")
		vim.cmd.hi("NonText guibg=none")
		vim.cmd.hi("Normal ctermbg=none")
		vim.cmd.hi("NonText guibg=none")
	end,
}
