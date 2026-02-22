return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			picker = { enabled = true },
		},
	},
	{
		"dmtrKovalenko/fff.nvim",
		build = function()
			require("fff.download").download_or_build_binary()
		end,
		dependencies = {
			{ "folke/snacks.nvim" },
		},
		lazy = false,
		keys = {
			{
				"<leader>sf",
				function()
					require("fff").find_files()
				end,
				desc = "Search files",
			},
			{
				"<leader>sg",
				function()
					require("fff").live_grep()
				end,
				desc = "Search grep",
			},
			{
				"fz",
				function()
					require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
				end,
				desc = "Fuzzy grep",
			},
			{
				"fc",
				function()
					require("fff").live_grep({ query = vim.fn.expand("<cword>") })
				end,
				desc = "Search current word",
			},
		},
	},
}
