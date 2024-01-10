local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  { import = "custom.configs.extras.mason" },
  -- { import = "custom.configs.extras.mason-null-ls" },
  { import = "custom.configs.extras.dressing" },
  { import = "custom.configs.extras.surround" },
  -- { import = "custom.configs.extras.rust-tools" },
  { import = "custom.configs.extras.formatter" },


  -- Install plugins
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- autoclose tags
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local merge_tb = vim.tbl_deep_extend
      local M = require("plugins.configs.cmp")
      M = merge_tb("force", M, overrides.cmp)
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  {
    "folke/which-key.nvim",
    opts = overrides.whichkey,
  },
}

return plugins
