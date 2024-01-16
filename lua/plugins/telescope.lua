return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "   ",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal", -- Ensure the layout is horizontal
					layout_config = {
						horizontal = {
							prompt_position = "top", -- Set the prompt to the top
							preview_width = 0.6, -- Adjust the preview width as needed
							results_width = 0.4, -- Adjust the results width accordingly
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
