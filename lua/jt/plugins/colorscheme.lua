return {
	"cocopon/iceberg.vim",
	lazy = false,
	priority = 1000,
	config = function()
		-- Ensure true colors and dark background
		vim.opt.termguicolors = true
		vim.opt.background = "dark"

		-- Apply colorscheme
		vim.cmd.colorscheme("iceberg")

		-- Optional: Custom highlight overrides after loading
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1e2132" })
		vim.api.nvim_set_hl(0, "Visual", { bg = "#272c42" })

		-- Optional: Airline theme integration (if using airline)
		if vim.g.loaded_airline then
			vim.g.airline_theme = "iceberg"
		end
	end,
}
