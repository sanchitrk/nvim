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

  -- 3. DAP for debugging
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "codelldb" })
        end,
      },
    },
    opts = function()
      local dap = require("dap")
      if not dap.adapters.codelldb then
        require("dap").adapters.codelldb = {
          type = "server",
          port = "${port}",
          executable = {
            command = "codelldb",
            args = { "--port", "${port}" },
          },
        }
      end
      dap.configurations.zig = {
        {
          name = "Launch executable",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
    end,
  },

  -- 4. Formatting (conform.nvim)
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        zig = { "zigfmt" },
      },
    },
  },

  -- 5. Test Runner (neotest)
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "lawrence-laz/neotest-zig",
    },
    opts = {
      adapters = {
        ["neotest-zig"] = {},
      },
    },
  },
}
