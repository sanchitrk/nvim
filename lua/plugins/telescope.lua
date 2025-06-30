return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>pf",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find Files",
    },
    {
      "<C-p>",
      function()
        require("telescope.builtin").git_files()
      end,
      desc = "Git Files",
    },
    {
      "<leader>ps",
      function()
        local input = vim.fn.input("Grep > ")
        if input ~= "" then
          require("telescope.builtin").grep_string({ search = input })
        end
      end,
      desc = "Grep String via Input",
    },
  },
}
