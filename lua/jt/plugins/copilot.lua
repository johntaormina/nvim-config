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
					enabled = false,
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
				"<leader>ce",
				":Copilot enable<CR>",
				{ noremap = true, silent = true, desc = "Enable Copilot" }
			)
			vim.keymap.set(
				"n",
				"<leader>cd",
				":Copilot disable<CR>",
				{ noremap = true, silent = true, desc = "Disable Copilot" }
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

			-- Toggle Copilot suggestion mode
			vim.keymap.set("n", "<leader>ct", function()
				local suggestion_enabled = require("copilot.suggestion").is_enabled()
				if suggestion_enabled then
					vim.cmd("Copilot suggestion disable")
					print("Copilot suggestions disabled")
				else
					vim.cmd("Copilot suggestion enable")
					print("Copilot suggestions enabled")
				end
			end, { noremap = true, silent = true, desc = "Toggle Copilot suggestions" })
		end,
	},

	-- -- Copilot-cmp integration
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	dependencies = {
	-- 		"zbirenbaum/copilot.lua",
	-- 		"hrsh7th/nvim-cmp",
	-- 	},
	-- 	config = function()
	-- 		require("copilot_cmp").setup({
	-- 			method = "getCompletionsCycling",
	-- 			formatters = {
	-- 				label = require("copilot_cmp.format").format_label_text,
	-- 				insert_text = require("copilot_cmp.format").format_insert_text,
	-- 				preview = require("copilot_cmp.format").deindent,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	--
	-- -- Copilot Chat
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
				":CopilotChatVisual<CR>",
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
				":CopilotChatExplainVisual<CR>",
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
				":CopilotChatReviewVisual<CR>",
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
				":CopilotChatTestsVisual<CR>",
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
				":CopilotChatFixVisual<CR>",
				{ noremap = true, silent = true, desc = "Fix selected code" }
			)
		end,
	},
}
