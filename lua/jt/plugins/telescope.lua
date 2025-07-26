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

		-- File navigation
		map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
		map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
		map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
		map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
		map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
		map("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "Find word under cursor" })

		-- LSP Telescope integrations
		map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to definition" })
		map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", { desc = "Find references" })
		map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Go to implementation" })
		map("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Go to type definition" })
		map("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })
		map("n", "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Workspace symbols" })
		map("n", "<leader>ca", "<cmd>Telescope lsp_code_actions<CR>", { desc = "Code actions" })
		map("n", "<leader>gD", "<cmd>Telescope lsp_declarations<CR>", { desc = "Go to declaration" })

		-- Diagnostics
		map("n", "<leader>dd", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Document diagnostics" })
		map("n", "<leader>dw", "<cmd>Telescope diagnostics<CR>", { desc = "Workspace diagnostics" })

		-- Call hierarchy
		map("n", "<leader>ci", "<cmd>Telescope lsp_incoming_calls<CR>", { desc = "Incoming calls" })
		map("n", "<leader>co", "<cmd>Telescope lsp_outgoing_calls<CR>", { desc = "Outgoing calls" })
	end,
}
