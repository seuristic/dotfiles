local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier, -- .with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars", "python" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
  b.formatting.black,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
