return {
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
        config_path = vim.fn.stdpath("data") .. "/codeium/config.json",
        bin_path = vim.fn.stdpath("data") .. "/codeium/bin",
      })
    end,
  },
}
