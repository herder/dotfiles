-- stylua: ignore
  -- add melange colorscheme
return {
  { "savq/melange-nvim" },
  {"rebelot/kanagawa.nvim"},

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },


}
