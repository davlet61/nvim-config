
return {
  "nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      enable_diagnostics = true,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      sort_case_insensitive = true,
      group_empty_dirs = true,
      renderers = {
        directory = {
          { "indent" },
          { "icon" },
          { "current_filter" },
          { "name" },
          { "clipboard" },
          { "diagnostics", errors_only = true },
        },
        file = {
          { "indent" },
          { "icon" },
          {
            "name",
            use_git_status_colors = true,
            zindex = 10,
          },
          { "clipboard" },
          { "bufnr" },
          { "modified" },
          { "diagnostics" },
          { "git_status" },
        },
      },
      window = {
        position = "right",
        -- keys
        -- width = "100%", -- Uncomment this if you want to set a specific width
      },
    })

    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Explorer" })
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
  end,
}

