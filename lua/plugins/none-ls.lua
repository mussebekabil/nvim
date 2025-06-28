return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    --  local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting
    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint_d"),
        formatting.stylua,
        formatting.prettier,
        -- diagnostics.eslint_d,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
