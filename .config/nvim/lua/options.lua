vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- UI
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 999
vim.opt.listchars = { trail = "•", nbsp = "␣", precedes = "<", extends = ">" }
vim.opt.guicursor = "n-v-c:hor30,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Find
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- NetRW
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 4
vim.g.netrw_browse_split = 3
vim.g.netrw_winsize = 25
vim.g.netrw_keepdir = 0
vim.g.localcopydircmd = "cp -r"
