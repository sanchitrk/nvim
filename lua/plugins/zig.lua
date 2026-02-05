-- Zig language support
-- NOTE: zls must be installed manually and available in PATH
--       Install via: brew install zls (macOS) or from https://github.com/zigtools/zls
return {
  -- 1. Syntax Highlighting (Treesitter)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "zig" })
      end
    end,
  },

  -- 2. LSP Configuration (zls)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        zls = {
          mason = false, -- Use system zls instead of Mason
          cmd = { "zls" },
          settings = {
            zls = {
              enable_inlay_hints = true,
              enable_snippets = true,
              warn_style = true,
            },
          },
        },
      },
    },
  },
}
