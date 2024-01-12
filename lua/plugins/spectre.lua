return {
	{
		"nvim-pack/nvim-spectre",
		cmd = "Spectre",
		opts = function()
			local prefix = "<leader>s"
			return {
				mapping = {
					send_to_qf = { map = prefix .. "q" },
					replace_cmd = { map = prefix .. "c" },
					show_option_menu = { map = prefix .. "o" },
					run_current_replace = { map = prefix .. "C" },
					run_replace = { map = prefix .. "R" },
					change_view_mode = { map = prefix .. "v" },
					resume_last_search = { map = prefix .. "l" },
				},
			}
		end,
		config = function()
			require("spectre").setup()
		end,
	},
}

-- -- Spectre
-- -- vim.keymap.set("n", "<leader>s", { desc = "󰛔 Search/Replace" })
-- vim.keymap.set("n", "<leader>ss", function()
-- 	require("spectre").open()
-- end, { desc = "Spectre" })
-- vim.keymap.set("n", "<leader>ss", function()
-- 	require("spectre").open_file_search()
-- end, { desc = "Spectre (current file)" })
-- vim.keymap.set("n", "<leader>sw", function()
-- 	require("spectre").open_visual()({ select_word = true })
-- end, { desc = "Spectre (current word)" })
