return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.8",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").setup({
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})

		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- File navigation
		map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts) -- Find files
		map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts) -- Find text in files
		map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts) -- Find buffers
		map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts) -- Help tags
		map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", opts) -- Recent files
		map("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", opts) -- Find word under cursor

		-- LSP Telescope integrations
		map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- Go to definition
		map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts) -- Find references
		map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- Go to implementation
		map("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- Go to type definition
		map("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- Document symbols
		map("n", "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<CR>", opts) -- Workspace symbols
		map("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<CR>", opts) -- Code actions
		map("n", "<leader>gD", "<cmd>Telescope lsp_declarations<CR>", opts) -- Go to declaration

		-- Diagnostics
		map("n", "<leader>dd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- Document diagnostics
		map("n", "<leader>dw", "<cmd>Telescope diagnostics<CR>", opts) -- Workspace diagnostics

		-- Call hierarchy (if supported by your language server)
		map("n", "<leader>ci", "<cmd>Telescope lsp_incoming_calls<CR>", opts) -- Incoming calls
		map("n", "<leader>co", "<cmd>Telescope lsp_outgoing_calls<CR>", opts) -- Outgoing calls
	end,
}
