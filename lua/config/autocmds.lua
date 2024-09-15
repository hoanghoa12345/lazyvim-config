-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local function is_deno_lsp()
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    if client.name == "denols" and client.server_capabilities.documentFormattingProvider then
      return true
    end
  end
  return false
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.ts", "*.js", "*.tsx", "*.jsx" },
  desc = "Auto-format Deno files after saving",
  callback = function()
    local fileName = vim.api.nvim_buf_get_name(0)
    if is_deno_lsp() then
      vim.cmd("silent !deno fmt " .. fileName)
    else
      vim.cmd("silent !prettier --write " .. fileName)
    end
  end,
  group = augroup("deno_formatting"),
})
