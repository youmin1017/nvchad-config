---@type NvPluginSpec
local spec = {
  "mfussenegger/nvim-dap",
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "rust-lang/rust.vim",
    init = function(_)
      vim.g.rustfmt_autosave = 1
    end,
  },
}

return spec
