local M = {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      csharp = { "sonarlint-language-server" },
      cs = { "sonarlint-language-server" },
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
      -- javascriptreact = { "eslint_d" },
      -- typescriptreact = { "eslint_d" },
      -- svelte = { "eslint_d" },
      -- python = { "pylint" },
    }

    vim.keymap.set("n", "<leader>l", function()
      print('fabricated')
      lint.try_lint()
    end, { desc = "Trigger linter for current file" })
  end,
}


return M
