return {
  "neovim/nvim-lspconfig",
  config = function()
    local nvim_lsp = require("lspconfig")
    nvim_lsp.denols.setup({
      root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
    })
    nvim_lsp.tsserver.setup({
      root_dir = nvim_lsp.util.root_pattern("package.json"),
      single_file_support = false,
    })
  end,
}
