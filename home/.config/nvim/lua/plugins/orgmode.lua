-- orgmode is quite buggy still...
if false then
  return {}
end

return {
  "nvim-orgmode/orgmode",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter", lazy = true },
  },
  event = "VeryLazy",
  config = function()
    -- Load treesitter grammar for org
    -- require("orgmode").setup_ts_grammar()

    -- Setup treesitter
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = false,
        additional_vim_regex_highlighting = { "org" },
      },
      ensure_installed = { "org" },
    })

    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = "~/Dropbox/org/**/*",
      org_default_notes_file = "~/Dropbox/org/refile.org",
      org_capture_templates = {
        t = {
          description = "Task",
          template = "* TODO %?\n %u",
          target = "~/Dropbox/org/inbox.org",
        },
        T = {
          template = "* TODO %?\n %u\n %f",
          description = "Task with link",
          target = "~/Dropbox/org/inbox.org",
        },
        j = {
          template = "\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?",
          description = "Journal",
          target = "~/Dropbox/org/journal/%<%Y-%m>.org",
        },
        description = "Event",
        e = {
          subtemplates = {
            r = {
              description = "recurring",
              template = "** %?\n %T",
              target = "~/Dropbox/org/calendar.org",
              headline = "Recurring",
            },
            o = {
              description = "one-time",
              template = "** %?\n %T",
              target = "~/Dropbox/org/calendar.org",
              headline = "One-time",
            },
          },
        },
      },
    })
  end,
}
