-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Push system clipboard into yanky's history ring when regaining focus
vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    local ok, yanky_history = pcall(require, "yanky.history")
    if not ok then
      return
    end
    local reg_info = require("yanky.utils").get_register_info("+")
    if reg_info and reg_info.regcontents ~= "" then
      yanky_history.push(reg_info)
    end
  end,
})
