return {
	"tpope/vim-fugitive",
	cmd = {
		"G",
		"Git",
		"Gread",
		"Gwrite",
		"Ggrep",
		"GMove",
		"GDelete",
		"GBrowse",
		"GRemove",
		"GRename",
		"Glgrep",
		"Gedit",
	},
	ft = { "fugitive" },
	keys = {
		{ "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
		{ "<leader>gd", "<cmd>Gvdiffsplit<CR>", desc = "Git diff" },
		{ "<leader>gC", "<cmd>Git commit<CR>", desc = "Git commit" },
		{ "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
		{ "<leader>gl", "<cmd>Git pull<CR>", desc = "Git pull" },
		{ "<leader>gB", "<cmd>Git blame<CR>", desc = "Git blame" },
	},
}
