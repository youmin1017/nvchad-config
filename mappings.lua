---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<leader>f"] = "",
    ["<leader>e"] = "",
    ["<C-s>"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<"] = { "<<", "indent forward easily", opts = { nowait = true } },
    [">"] = { ">>", "indent forward easily", opts = { nowait = true } },
    ["gh"] = { "g0", "Go to beginning" },
    ["gl"] = { "g$", "Go to end of line" },
    ["X"] = {
      function()
        require("nvchad_ui.tabufline").closeAllBufs()
      end,
      "close all tabufline buffers",
    },

    --- clipboard ---
    ["<leader>y"] = { '"+y', "Yank to system clipboard" },
    ["<leader>Y"] = { '"+yy', "Yank line to system clipboard" },
    ["<leader>p"] = { '"+p', "Paste from system clipboard" },
    ["<leader>P"] = { '"+P', "Paste from system clipboard before cursor" },
    ["<leader>d"] = { '"+d', "Delete to system clipboard" },

    ["<M-j>"] = { ":m .+1<CR>==", "move selected block up and stay in visual mode", opts = { silent = true } },
    ["<M-k>"] = { ":m .-2<CR>==", "move selected down and stay in visual mode", opts = { silent = true } },
  },

  x = {
    ["<"] = { "<gv", "indent backword and stay in visual mode" },
    [">"] = { ">gv", "indent forward and stay in visual mode" },
    ["<M-j>"] = { ":move '>+1<CR>gv-gv", "move selected block up and stay in visual mode", opts = { silent = true } },
    ["<M-k>"] = { ":move '<-2<CR>gv-gv", "move selected down and stay in visual mode", opts = { silent = true } },
    ["gh"] = { "g0", "Go to beginning" },
    ["gl"] = { "g$", "Go to end of line" },

    -- clipboar
    ["<leader>y"] = { '"+y', "Yank to system clipboard in visual mode" },
    ["<leader>p"] = { '"+p', "Paste from system clipboard in visual mode" },
    ["<leader>P"] = { '"+P', "Paste from system clipboard before cursor in visual mode" },
    ["<leader>d"] = { '"+d', "Delete to system clipboard in visual mode" },
  },
}

M.telescope = {
  n = {
    ["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "list diagnostics" },
    ["<leader>fc"] = { "<cmd> Telescope command_history <CR>", "list command historys" },
  },
}

M.lspconfig = {
  n = {
    ["<leader>q"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "floating diagnostic",
    },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "toggle breakpoint" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

return M
