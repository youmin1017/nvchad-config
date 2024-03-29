local M = {}

M.treesitter = {
  autotag = {
    enable = true,
  },
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    disable = {
      "python",
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
  },
}

-- git support in nvimtree
M.nvimtree = {
  on_attach = require "custom.configs.nvimtree",
  trash = {
    cmd = "trash -F",
  },
  experimental = {
    git = {
      async = true,
    },
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        git = {
          untracked = "", -- "󰧟",
        },
      },
    },
  },
}

local actions = require "telescope.actions"
M.telescope = {
  defaults = {
    mappings = {
      i = {
        -- ["<Down>"] = actions.cycle_history_next,
        -- ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
}

local cmp = require "cmp"
M.cmp = {
  mapping = {
    ["<C-p>"] = nil,
    ["<C-n>"] = nil,
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        row = 0.15,
        col = 0.1,
        width = 0.8,
        height = 0.7,
        border = "single",
      },
    },
  },
}

M.cmp = {
  mapping = {
    ["<C-p>"] = {},
    ["<C-n>"] = {},
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-s>"] = require("cmp").mapping.complete(),
    ["<C-Space>"] = {},
  },
}

M.whichkey = {
  plugins = {
    presets = {
      operators = false,
    },
  },
}

return M
