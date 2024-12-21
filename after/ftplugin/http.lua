vim.api.nvim_set_keymap("n", "r", "", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "rr", ":Rest run<CR>", { noremap = true, silent = true })

vim.cmd.hi("Comment gui=none")
vim.cmd.hi("Normal guibg=none")
vim.cmd.hi("NonText guibg=none")
vim.cmd.hi("Normal ctermbg=none")
vim.cmd.hi("NonText guibg=none")
