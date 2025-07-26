return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		wk.setup({
			-- Configuration options
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			layout = {
				height = { min = 4, max = 25 }, -- min and max height of the columns
				width = { min = 20, max = 50 }, -- min and max width of the columns
				spacing = 3, -- spacing between columns
				align = "left", -- align columns left, center or right
			},
			show_help = true, -- show help message on the command line when the popup is visible
		})

		-- Register group descriptions
		wk.register({
			["<leader>f"] = { name = "Find/Files" },
			["<leader>g"] = { name = "Git/Go to" },
			["<leader>d"] = { name = "Diagnostics/Delete" },
			["<leader>c"] = { name = "Copilot/Code" },
			["<leader>w"] = { name = "Window" },
			["<leader>t"] = { name = "Tabs" },
			["<leader>S"] = { name = "Search/Replace" },
		})
	end,
}
