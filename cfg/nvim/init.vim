filetype plugin indent on
syntax on
set backspace=eol,start
set path=.,**,/usr/include,/usr/local/include
set wildignore=*.o
set incsearch nohlsearch
set number relativenumber
set listchars=eol:$,tab:»·,trail:= list
set scrolloff=3
set wildmenu
set ruler
set ignorecase smartcase tagcase=match
set lazyredraw
set tabstop=8 shiftwidth=0 smarttab copyindent
set splitbelow splitright
set mouse=a
set fileformat=unix fileformats=unix,dos
set encoding=utf-8
set laststatus=2
set hidden

colorscheme pablo
if $TERM != "linux"
	set termguicolors
	let &t_8f="\<esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<esc>[48;2;%lu;%lu;%lum"
endif

let mapleader = " "

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_preview = 1
let g:netrw_alto = 0
let g:netrw_winsize=86
let g:netrw_browse_split = 4
let g:netrw_dirhistmax = 0

let g:vimwiki_list = [
\	{
\		'path': '~/lib/wiki',
\		'path_html': '~/lib/wiki/html',
\		'syntax': 'markdown',
\		'ext': '.md',
\	}
\]

highlight CursorLine cterm=NONE ctermbg=242
highlight CursorColumn cterm=NONE ctermbg=242
noremap <silent> <leader>c <cmd>se cul! cuc!<cr>
nnoremap <leader>f <cmd>call cursor(0, &tw+2)<cr>F r<cr>

noremap <up> <nop>
noremap! <up> <esc>
noremap <down> <nop>
noremap! <down> <esc>
noremap <left> gT
noremap! <left> <esc>
noremap <right> gt
noremap! <right> <esc>

nnoremap <silent> <leader>sv <cmd>source $MYVIMRC<cr>

inoremap <C-s> <C-x><C-o>
nnoremap / /\v

if has('nvim-0.5')
	packadd nvim-lspconfig
	packadd nvim-treesitter
	lua <<!
	-- TODO: don’t try to reformat VimL
function my_on_attach(client)
	vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)')
	vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {
		noremap = true,
		silent = true,
	})
	vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end
lsp = require 'nvim_lsp'
lsp.pyls.setup{on_attach = my_on_attach}
lsp.gopls.setup{on_attach = my_on_attach}
lsp.vimls.setup{on_attach = my_on_attach}

tsc = require 'nvim-treesitter.configs'
tsc.setup {
	highlight = {enable = true},
	indent = {enable = true},
}
!
endif
