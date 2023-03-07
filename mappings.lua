---@type MappingsTable
local M = {}

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

-- more keybinds!

return M
