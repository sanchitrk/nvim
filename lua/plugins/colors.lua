return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      terminal_colors = true, -- load terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_indent_guides = false,
      inverse = true, -- invert background for search, diffs, etc.
      contrast = "soft", -- "soft", "medium" or "hard"
      dim_inactive = false,
      transparent_mode = true, -- keep your transparency preference

      -- Override specific highlight groups
      overrides = {
        SignColumn = { bg = "NONE" },
        NonText = { fg = "#504945" },
        CursorLine = { bg = "#32302f" },
        CursorLineNr = { fg = "#fabd2f", bold = true },
        Visual = { bg = "#504945" },

        -- Make floats readable even when transparent
        NormalFloat = { bg = "#1d2021" },
        FloatBorder = { bg = "#1d2021", fg = "#a89984" },

        -- Better diagnostic colors
        DiagnosticError = { fg = "#fb4934" },
        DiagnosticWarn = { fg = "#fabd2f" },
        DiagnosticInfo = { fg = "#83a598" },
        DiagnosticHint = { fg = "#8ec07c" },

        -- Make comments easier to read
        Comment = { fg = "#928374", italic = true },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
