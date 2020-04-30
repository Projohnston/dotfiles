" functions.vim file is used to define general-use functions rather than in the master vimrc file, in order to
" save on space, and compartmentalization.



" Function to determine whether or not there are any open files in current vim buffer (@%), if so then open file in
" current tab, if not then open in a new tab.

		function! OpenFileInNextAvailableBuffer(filename)
			if @% == ""
				execute "e " . a:filename
			else
				execute "tabnew " . a:filename
			endif
		endfunction

" Enables spellcheck if disabled, moves cursor to next typo, asks if it should be changed to the first
" spellcheck recommendation, then moves to the next one until an <Esc> key is pressed.
	function SuperSpellCheck()

	" Redirects output into x variable (only way to do this afaik).
		redir => x
		silent execute "setlocal spell?"
		redir END
	" Evaluates spell option value, enables if disabled.
		if x == "nospell"
			" silent setlocal spell
		else
			echo "Apparently x != \"nospell\", and has val of: " . x
		endif
	" (Temporary) Jumps to beginning of file, then jumps to next typo, opens list of suggestions and waits for
	" yes or no,
	endfunction

	cnoreabbrev	ssc	call SuperSpellCheck()

" Function for bash script file preamble info.
	function BashHeaders()
		:norm I#!/usr/bin/env bash
		:r! echo %:p
		:norm I#
	endfunction
	cnoreabbrev bashhead call BashHeaders()

" Command + abbreviation to delete the file open in current tab, as well as a 'purge all' option.
"	(Too braindead to figure out right now, come back to this later).

	"	cnoreabbrev <silent>	:exe 'call delete(expand('%'))'
	"	exe 'call delete(expand('%')) | bdelete!'

" Function to surround word in cursor with either single or double quotes.

" Function to insert the full filepath at the cursor prepended with a # just so it's easier
	function InsertFullFilePath()
		:put =expand('%:p')
		norm I#
		norm o#
		startinsert!
	endfunction

" Function to flash a pair of cross-hairs on the cursor for 100ms.
	function Flash()
		set cursorline cursorcolumn
		redraw
		sleep 100m
		set nocursorline nocursorcolumn
	endfunction