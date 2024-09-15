return {
  {
    "lukas-reineke/lsp-format.nvim",
    config = function()
      require("lsp-format").setup({})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local nvim_lsp = require("lspconfig")
      nvim_lsp.denols.setup({
        on_attach = require("lsp-format").on_attach,
        root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
      })
      nvim_lsp.tsserver.setup({
        on_attach = require("lsp-format").on_attach,
        root_dir = nvim_lsp.util.root_pattern("package.json"),
        single_file_support = false,
      })
    end,
  },
}
