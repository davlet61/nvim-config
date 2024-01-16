return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local map = vim.keymap.set

		require("neo-tree").setup({
			close_if_last_window = true,
			enable_diagnostics = true,
			filesystem = {
				follow_current_file = { enabled = true },
				hijack_netrw_behavior = "open_current",
				use_libuv_file_watcher = true,
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
			commands = {
				system_open = function(state)
					vim.ui.open(state.tree:getNode():get_id())
				end,
				parent_or_close = function(state)
					local node = state.tree:get_node()
					if (node.type == "directory" or node:has_children()) and node:is_expanded() then
						state.commands.toggle_node(state)
					else
						require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
					end
				end,
				child_or_open = function(state)
					local node = state.tree:get_node()
					if node.type == "directory" or node:has_children() then
						if not node:is_expanded() then -- if unexpanded, expand
							state.commands.toggle_node(state)
						else -- if expanded and has children, seleect the next child
							require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
						end
					else -- if not a directory just open it
						state.commands.open(state)
					end
				end,
				find_in_dir = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					require("telescope.builtin").find_files({
						cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
					})
				end,
			},
		})

		map("n", "<leader>o", function()
			if vim.bo.filetype == "neo-tree" then
				vim.cmd.wincmd("p")
			else
				vim.cmd.Neotree("focus")
			end
		end, { desc = "Toggle Explorer Focus" })
		map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Explorer" })
		-- map("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
