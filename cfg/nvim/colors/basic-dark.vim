" TODO: make cursor^(column line) work correctly
highlight clear
set background=dark
if exists("syntax_on")
	syntax reset
endif

highlight Normal	cterm=NONE ctermfg=White ctermbg=Black gui=NONE guifg=#ffffff guibg=#000000
highlight Todo	cterm=NONE ctermfg=Red ctermbg=Black gui=NONE guifg=#ff0000 guibg=#000000
highlight Comment	cterm=NONE ctermfg=DarkGray ctermbg=Black gui=NONE guifg=#808080 guibg=#000000
highlight Constant	cterm=italic ctermfg=White ctermbg=Black gui=italic guifg=#ffffff guibg=#000000
highlight Statement	cterm=bold ctermfg=White ctermbg=Black gui=bold guifg=#ffffff guibg=#000000

let g:colors_name = "basic-dark"
