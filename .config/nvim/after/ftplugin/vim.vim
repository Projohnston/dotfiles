" ~/.config/nvim/ftplugin/vim.vim
" Settings to be applied to all vim filetype files. words words words words

setlocal syntax=vim
setlocal tabstop=2
setlocal shiftwidth=2
setlocal textwidth=110
setlocal comments+=b:>
setlocal formatoptions=
setlocal formatoptions+=cor

" if exists("b:did_ftplugin")
" 	finish
" endif



" Commenting this out for now, might've gotten it to work digging through documentation.

"	augroup vimSyntax
"		au!
"		autocmd Syntax	<buffer>	call	SetVimSyntax()
"	augroup END
"
"	function! SetVimSyntax()
"
"		setlocal syntax=vim
"		setlocal tabstop=2
"		setlocal shiftwidth=2
"		setlocal textwidth=110
"		setlocal comments+=b:>
"		setlocal formatoptions=
"
"		" Remove the autogroup
"		au! vimSyntax
"
"	endfunction


" Sets .vim filetype formatting to use tabs with 2 spaces. word words words words words words, more more
" words

" set formatoptions=cro
" set formatoptions=rca



" Automatically runs command to call function to apply vimscript formatting
" options.
" (Potentially useless and causing errors).
" autocmd Filetype vim call SetVimOptions()
