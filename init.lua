local opt = vim.opt

local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

-------------------------------------- options ------------------------------------------

-- To enable fig autocomplete
-- ref: https://github.com/withfig/fig/issues/2380#issuecomment-1449107507
vim.fn.setenv("FIG_TERM", nil)
vim.fn.setenv("PAGER", "less")

vim.wo.wrap = false

-------------------------------------- autocmnds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

autocmd("VimEnter", {
  callback = open_nvim_tree
})

-- ~/.config/nvim/lua/custom/init.lua

-------------------------------------- Fold ------------------------------------------
-- vim.foldmethod='indnt'
-- vim.nofoldenable=true
-- vim.foldlevel=99
