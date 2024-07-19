local options = {
  noremap = true,
  silent = true,
}

------------------
--- Normal Mode --
------------------

-- Navigation
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', options)
vim.keymap.set('n', '<C-q>', ':tabclose<CR>', options)

-- Use arrows to resize
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', options)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', options)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', options)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', options)

-------------------
--- Visual Mode ---
-------------------

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
