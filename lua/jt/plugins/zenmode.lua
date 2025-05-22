return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	keys = {
		{ "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
		{
			"<leader>Z",
			function()
				require("zen-mode").toggle({ window = { width = 120 } })
			end,
			desc = "Zen Mode (wide)",
		},
	},
	opts = {
		window = {
			backdrop = 0.95, -- shade the backdrop of the Zen window
			width = 80, -- width of the Zen window
			height = 1, -- height of the Zen window
			options = {
				signcolumn = "no", -- disable signcolumn
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				foldcolumn = "0", -- disable fold column
				list = false, -- disable whitespace characters
			},
		},
		plugins = {
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = false, -- disables the command in the last line of the screen
				laststatus = 0, -- turn off the statusline in zen mode
			},
			twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
			gitsigns = { enabled = false }, -- disables git signs
			tmux = { enabled = false }, -- disables the tmux statusline
			kitty = {
				enabled = false,
				font = "+4", -- font size increment
			},
		},
	},
}
