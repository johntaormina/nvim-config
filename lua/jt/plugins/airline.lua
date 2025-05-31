return {
	"vim-airline/vim-airline",
	dependencies = {
		"vim-airline/vim-airline-themes",
	},
	event = "VimEnter",
	config = function()
		-- Minimal setup
		vim.g.airline_theme = "monochrome"
		vim.g.airline_powerline_fonts = 1
		vim.g["airline#extensions#tabline#enabled"] = 1

		-- Disable some extensions for cleaner look
		vim.g["airline#extensions#whitespace#enabled"] = 0
		vim.g["airline#extensions#hunks#enabled"] = 0
	end,
}
