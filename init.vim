call plug#begin('~/.local/share/nvim/plugged')

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'

Plug 'scrooloose/nerdtree'
let g:lsp_async_completion = 1

call plug#end()

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go "LspDocumentFormatSync<CR>"
endif

set number
map <C-n> :NERDTreeToggle<CR>
