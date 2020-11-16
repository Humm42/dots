setlocal shiftwidth=0 noexpandtab
setlocal formatprg=gofmt
if !has('nvim-0.5')
	" TODO: do not reset cursor position smh
	autocmd BufWritePre <buffer> %!gofmt
endif
