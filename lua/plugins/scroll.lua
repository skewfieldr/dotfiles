return {
	"karb94/neoscroll.nvim",
	opts = {},
	config = function()
		local scroll = require('neoscroll')
		scroll.setup({
			duration_multiplier = 0.7
		})
	end
}
