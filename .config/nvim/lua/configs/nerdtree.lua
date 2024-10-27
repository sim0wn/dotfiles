-- Auto close
vim.cmd([[
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif
]])

-- Keymaps
vim.keymap.set('n', '<leader>fe', ':NERDTreeToggle<CR>')

-- Settings
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeIgnore = { '\\.pyc$', '\\~$', '\\.swp$', '\\.git$', 'node_modules' }
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinPos = "left"
vim.g.NERDTreeWinSize = 40