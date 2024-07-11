local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    javascript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    python = { "black" },
  },

  -- Set the log level. Use `:ConformInfo` to see the location of the log file.
  log_level = vim.log.levels.ERROR,

  -- Conform will notify you when a formatter errors
  notify_on_error = true,

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
