-- stylua: ignore

return {
  -- add tmux navigator
  { "christoomey/vim-tmux-navigator",
    keys = {
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Go to the left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Go to the down pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Go to the up pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Go to the right pane" },
    },
    event = "VimEnter",
  },

  { "nvim-focus/focus.nvim", version = false,
    init = function()
      require("focus").setup({ })
      vim.keymap.set( "n", "<leader>wn", function ()
        require("focus").split_nicely()
      end, {desc = "Split Left" })
      vim.keymap.set( "n", "<leader>wn", function ()
        require("focus").split_nicely()
      end, {desc = "Split Nicely" })
      local focusmap = function(direction)
        vim.keymap.set('n', '<leader>w'..direction, function()
          require('focus').split_command(direction)
        end, { desc = string.format('Create or move to split (%s)', direction) })
      end

      -- Use `<Leader>wh` to split the screen to the left, same as command FocusSplitLeft etc
      focusmap('h')
      focusmap('j')
      focusmap('k')
      focusmap('l')
    end,
  },
}
