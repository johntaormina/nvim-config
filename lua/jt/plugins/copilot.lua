-- copilot.lua
-- Module for configuring GitHub Copilot, copilot-cmp, and Copilot Chat with keymaps

return {
	-- GitHub Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<Tab>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = true,
					markdown = true,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 16.x
				server_opts_overrides = {},
			})

			-- Set up keymaps for Copilot
			vim.keymap.set(
				"n",
				"<leader>cp",
				":Copilot panel<CR>",
				{ noremap = true, silent = true, desc = "Open Copilot panel" }
			)
			vim.keymap.set(
				"n",
				"<leader>cs",
				":Copilot status<CR>",
				{ noremap = true, silent = true, desc = "Copilot status" }
			)
			vim.keymap.set("n", "<leader>cq", function()
				vim.ui.input({
					prompt = "Quick Chat: ",
				}, function(input)
					if input ~= "" then
						require("CopilotChat").ask(input)
					end
				end)
			end, { desc = "Quick Chat" })
		end,
	},
	--
	-- -- -- Copilot-cmp integration
	{
		"zbirenbaum/copilot-cmp",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("copilot_cmp").setup({
				method = "getCompletionsCycling",
				formatters = {
					label = require("copilot_cmp.format").format_label_text,
					insert_text = require("copilot_cmp.format").format_insert_text,
					preview = require("copilot_cmp.format").deindent,
				},
			})
		end,
	},

	-- -- -- Copilot Chat
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim",
		},
		opts = {
			debug = false,
			model = "gpt-4", -- or gpt-3.5-turbo
			show_help = true,
			selection = function(source)
				local select = require("CopilotChat.select")
				return select.visual(source) or select.buffer(source)
			end,
			prompts = {
				Explain = "Explain how the following code works:",
				Review = "Review the following code and provide suggestions for improvement:",
				Tests = "Generate unit tests for the following code:",
				Fix = "Fix the following code to address the issues mentioned in the comments:",
			},
		},
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		config = function(_, opts)
			require("CopilotChat").setup(opts)

			-- Set up keymaps for CopilotChat
			vim.keymap.set(
				"n",
				"<leader>cc",
				":CopilotChatOpen<CR>",
				{ noremap = true, silent = true, desc = "Open Copilot Chat" }
			)
			vim.keymap.set(
				"v",
				"<leader>cc",
				":CopilotChat<CR>",
				{ noremap = true, silent = true, desc = "Open Copilot Chat with visual selection" }
			)
			vim.keymap.set(
				"n",
				"<leader>ce",
				":CopilotChatExplain<CR>",
				{ noremap = true, silent = true, desc = "Explain code with Copilot Chat" }
			)
			vim.keymap.set(
				"v",
				"<leader>ce",
				":CopilotChatExplain<CR>",
				{ noremap = true, silent = true, desc = "Explain selected code" }
			)
			vim.keymap.set(
				"n",
				"<leader>cr",
				":CopilotChatReview<CR>",
				{ noremap = true, silent = true, desc = "Review code with Copilot Chat" }
			)
			vim.keymap.set(
				"v",
				"<leader>cr",
				":CopilotChatReview<CR>",
				{ noremap = true, silent = true, desc = "Review selected code" }
			)
			vim.keymap.set(
				"n",
				"<leader>ct",
				":CopilotChatTests<CR>",
				{ noremap = true, silent = true, desc = "Generate tests with Copilot Chat" }
			)
			vim.keymap.set(
				"v",
				"<leader>ct",
				":CopilotChatTests<CR>",
				{ noremap = true, silent = true, desc = "Generate tests for selected code" }
			)
			vim.keymap.set(
				"n",
				"<leader>cf",
				":CopilotChatFix<CR>",
				{ noremap = true, silent = true, desc = "Fix code with Copilot Chat" }
			)
			vim.keymap.set(
				"v",
				"<leader>cf",
				":CopilotChatFix<CR>",
				{ noremap = true, silent = true, desc = "Fix selected code" }
			)
		end,
	},
}
