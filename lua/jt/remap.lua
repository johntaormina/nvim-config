vim.g.mapleader = " "

vim.keymap.set("n", "-", "<CMD>Ex<CR>", { desc = "Open parent directory" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape" })
vim.keymap.set("v", "<leader>Sr", "y:%s/<C-r>0//gc<left><left><left>", { desc = "Search/replace visual" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-e>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

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
