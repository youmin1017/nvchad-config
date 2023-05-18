local options = {
  select = {
    -- Set to false to disable the vim.ui.select implementation
    enabled = true,

    -- Priority list of preferred vim.select implementations
    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

    -- Trim trailing `:` from prompt
    trim_prompt = true,

    -- Options for telescope selector
    -- These are passed into the telescope picker directly. Can be used like:
    telescope = require("telescope.themes").get_dropdown {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.6,
        height = 0.40,
        preview_cutoff = 120,
      },
    },
  },
}

---@type NvPluginSpec
local spec = {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function(_, _)
    require("dressing").setup(options)
  end,
}

return spec
