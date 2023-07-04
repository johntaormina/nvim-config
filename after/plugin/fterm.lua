require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
vim.keymap.set('n', '<leader>ft', '<CMD>lua require("FTerm").toggle()<CR>')
