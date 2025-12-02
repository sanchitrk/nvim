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
          -- IMPORTANT: prevents LazyVim from overwriting your zls with Mason's version
          mason = false,
          -- Use the zls command from your system PATH
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
