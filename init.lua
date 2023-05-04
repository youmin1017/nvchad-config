local opt = vim.opt

-------------------------------------- options ------------------------------------------

-- To enable fig autocomplete
-- ref: https://github.com/withfig/fig/issues/2380#issuecomment-1449107507
vim.fn.setenv("FIG_TERM", nil)

vim.wo.wrap = false

-------------------------------------- autocmnds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-------------------------------------- Fold ------------------------------------------
-- vim.foldmethod='indnt'
-- vim.nofoldenable=true
-- vim.foldlevel=99
