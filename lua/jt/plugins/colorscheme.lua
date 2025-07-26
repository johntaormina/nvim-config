return {
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			-- Ensure true colors and dark background
			vim.opt.termguicolors = true
			vim.opt.background = "dark"

			-- Apply colorscheme
			vim.cmd.colorscheme("github_dark_high_contrast")

			-- Optional: Custom highlight overrides after loading
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e2132" })
			vim.api.nvim_set_hl(0, "Visual", { bg = "#272c42" })
		end,
	},
	{
		"cocopon/iceberg.vim",
		lazy = true,
	},
}
