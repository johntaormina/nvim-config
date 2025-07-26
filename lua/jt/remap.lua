vim.g.mapleader = " "

vim.keymap.set("n", "-", "<CMD>Ex<CR>", { desc = "Open parent directory" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape" })
vim.keymap.set("v", "<leader>Sr", "y:%s/<C-r>0//gc<left><left><left>", { desc = "Search/replace visual" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (cursor stays)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search (centered)" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without losing register" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>X", [["_d]], { desc = "Delete to void register" })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-e>", "<Esc>", { desc = "Escape insert mode" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })
vim.keymap.set("n", "<leader>fF", vim.lsp.buf.format, { desc = "Format buffer with LSP" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })

vim.keymap.set(
	"n",
	"<leader>sW",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under cursor" }
)
vim.keymap.set("n", "<leader>xD", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Window width adjustment mappings
-- Decrease current window width by 50%
vim.keymap.set("n", "<leader>w-", function()
	-- Get current window width
	local current_width = vim.api.nvim_win_get_width(0)
	-- Calculate new width (50% smaller)
	local new_width = math.floor(current_width * 0.5)
	-- Set the new width
	vim.api.nvim_win_set_width(0, new_width)
	-- Optional: show a small notification
	vim.notify("Window width: " .. new_width, vim.log.levels.INFO)
end, { desc = "Decrease window width by 50%" })

-- Increase current window width by 50%
vim.keymap.set("n", "<leader>w+", function()
	-- Get current window width
	local current_width = vim.api.nvim_win_get_width(0)
	-- Calculate new width (50% larger)
	local new_width = math.floor(current_width * 1.5)
	-- Set the new width
	vim.api.nvim_win_set_width(0, new_width)
	-- Optional: show a small notification
	vim.notify("Window width: " .. new_width, vim.log.levels.INFO)
end, { desc = "Increase window width by 50%" })

-- Open config and plugins folder
vim.keymap.set("n", "<leader>cfg", ":edit ~/.config/nvim/lua/jt/<CR>", { desc = "Open config folder" })
vim.keymap.set(
	"n",
	"<leader>vfg",
	":vsplit | Explore ~/.config/nvim/lua/jt/<CR>",
	{ desc = "Vsplit and open config folder" }
)

vim.keymap.set("n", "<leader>tc", ":tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>tp", ":tabnext<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>to", ":tabprevious<CR>", { desc = "Go to previous tab" })
