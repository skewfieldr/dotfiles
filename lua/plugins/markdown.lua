return {
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {},
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
	config = function()
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = "*.md", -- or any markdown file type pattern
			callback = function()
				vim.cmd("MarkdownPreviewStop") -- Stop existing preview
				vim.cmd("MarkdownPreview") -- Start a new preview
			end,
		})
	end,
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
}
