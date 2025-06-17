require("config")
require("tests.pg")

-- NOTE: Lazy Setup

-- require("lazy")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"

  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require("lazy").setup({
  { "echasnovski/mini.nvim", version = false },
  require("plugins.scroll"),
  require("plugins.comment"),
  require("plugins.todocomments"),
  require("plugins.web-devicons"),
  require("plugins.telescope"),
  require("plugins.nvimtree"),
  require("plugins.harpoon"),
  require("plugins.which-key"),
  require("plugins.treesitter"),
  'hrsh7th/cmp-nvim-lsp',
  -- 'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-path',
  require("plugins.lsp"),
  -- require("plugins.lsp.cmp-lua"),
  require("plugins.lsp.autocompletion"),
  -- require("plugins.lsp.linter"),
  -- require("plugins.lsp.sonarlint"),
  require("plugins.lsp.sonarlint"),
  require("plugins.tokyonight"),
  require("plugins.autoformat"),
  -- require("plugins.rest"),
  require("plugins.vrc"),
  require("plugins.firenvim"),
  require("plugins.dap"),
  require("plugins.git"),
  require("plugins.trouble"),
  { 'tpope/vim-dadbod',      lazy = true },
  require("plugins.database"),
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  require("plugins.markdown"),
  require("plugins.oil"),
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

-- local sonarlint = require('plugins.lsp.sonarlint')
-- -- print(sonarlint)
-- sonarlint.setup({
--
--   server = {
--     cmd = {
--       'sonarlint-language-server',
--       -- Ensure that sonarlint-language-server uses stdio channel
--       '-stdio',
--       '-analyzers',
--       vim.fn.expand('$MASON/share/sonarlint-analyzers/sonarcsharp.jar'),
--       vim.fn.expand('$MASON/share/sonarlint-analyzers/csharpenterprise.jar'),
--     },
--     init_options = {
--       omnisharpDirectory = vim.fn.expand('$MASON/packages/sonarlint-language-server/extension/omnisharp'),
--       csharpOssPath = vim.fn.expand('$MASON/share/sonarlint-analyzers/sonarcsharp.jar'),
--       csharpEnterprisePath = vim.fn.expand('$MASON/share/sonarlint-analyzers/csharpenterprise.jar'),
--     },
--   },
--   filetypes = {
--     -- 'cs'
--   }
-- })


-- vim.cmd("hi ColorColumn guibg=red")
vim.cmd.hi("ColorColumn guibg=#424441")
vim.o.shiftwidth = 2
-- vim.cmd("hi ColorColumn ctermbg=red")
-- vim.cmd.hi("ColorColumn ctermbg=red")
-- vim: ts=2 sts=2 sw=2 et
