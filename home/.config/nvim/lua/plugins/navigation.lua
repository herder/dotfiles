-- stylua: ignore

return {
  -- add tmux navigator
  -- { "christoomey/vim-tmux-navigator" },
  { "nvim-focus/focus.nvim", version = false,

    keys = {
      {"<leader>wn", "<cmd>FocusSplitNicely<cr>", desc = "Split nicely" },
      {"<leader>wh", "<cmd>FocusSplitLeft<cr>", desc = "Split left" },
      {"<leader>wl", "<cmd>FocusSplitRight<cr>", desc = "Split right" },
      {"<leader>wk", "<cmd>FocusSplitUp<cr>", desc = "Split up" },
      {"<leader>wj", "<cmd>FocusSplitDown<cr>", desc = "Split down" },
    }
}
}
