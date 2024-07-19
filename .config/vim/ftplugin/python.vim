" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab

" Highlighting
let g:python_highlight_all = 1

" Linting and fixing
let b:ale_fixers = ['ruff_format']
let b:ale_linters = ['ruff']
