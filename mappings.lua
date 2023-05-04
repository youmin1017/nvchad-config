---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>f"] = "",
    ["<leader>e"] = "",
    ["<C-s>"] = "",
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<"] = { "<<", "indent forward easily", opts = { nowait = true } },
    [">"] = { ">>", "indent forward easily", opts = { nowait = true } },
  },

  x = {
    ["<"] = { "<gv", "indent backword and stay in visual mode"},
    [">"] = { ">gv", "indent forward and stay in visual mode"}
  },
}

M.telescope = {
  n = {
    ["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "list diagnostics" },
    ["<leader>fc"] = { "<cmd> Telescope command_history <CR>", "list command historys" },
  }
}

M.lspconfig = {
  n = {
    ["<leader>q"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "floating diagnostic",
    },
  }
}

return M
