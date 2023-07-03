
---@type NvPluginSpec
local spec = {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
  config = function()
    require "custom.configs.null-ls" -- require your null-ls config here (example below)
  end,
}

return spec
