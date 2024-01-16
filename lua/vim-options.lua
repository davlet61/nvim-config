vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.relativenumber = true
vim.o.cmdheight = 0

require("keymaps")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

local custom_highlights = require("highlights")()
local highlight_group = augroup("CustomHighlights", { clear = true })

autocmd("ColorScheme", {
  group = highlight_group,
  callback = function()
    -- Apply each of your custom highlights
    for group, spec in pairs(custom_highlights) do
      vim.api.nvim_set_hl(0, group, spec)
    end
  end,
})
vim.cmd("doautocmd ColorScheme")

-- autocmd("ColorScheme", {
--   desc = "Load custom highlights from user configuration",
--   group = augroup("astronvim_highlights", { clear = true }),
--   callback = function()
--     if vim.g.colors_name then
--       for _, module in ipairs { "init", vim.g.colors_name } do
--         for group, spec in pairs(astronvim.user_opts("highlights." .. module)) do
--           vim.api.nvim_set_hl(0, group, spec)
--         end
--       end
--     end
--     astroevent("ColorScheme", false)
--   end,
-- })
