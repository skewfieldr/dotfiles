local M = {
  "diepm/vim-rest-console",
  config = function()
    vim.g.vrc_response_default_content_type = 'application/json'
    vim.g.vrc_output_buffer_name = '__VRC_OUTPUT__'
    vim.g.vrc_curl_opts = {
      ["--silent"] = "",
      ["--show-error"] = "",
    }
    vim.g.vrc_auto_format_response_patterns = {
      json = 'jq .'
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "rest",
      callback = function()
        vim.keymap.del('n', '<C-j>', { buffer = 0 })
        vim.keymap.set('n', '<Leader>rr', function()
          vim.cmd("call VrcQuery()")
        end, { buffer = 0, desc = "Vim Rest Client - Call endpoint" })
      end
    })
    -- Associate .http files with 'rest' filetype
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "*.http",
      callback = function()
        vim.bo.filetype = "rest"
      end
    })

    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "__VRC_OUTPUT__",
      callback = function()
        vim.bo.filetype = "json"
      end,
    })
  end
}

return M
