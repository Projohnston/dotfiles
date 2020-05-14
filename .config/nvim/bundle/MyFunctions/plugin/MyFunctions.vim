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
	function InsertFullPath()
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

" Function to run pandoc command to compile the file open in current buffer in either HTML5 or PDF.
		function! Pan(type)
			if !exists(a:type)
				if(a:type == "html")
					silent execute "!pandoc " . @% . " -t html5 -o " . expand('%:r') . ".html"
				elseif(a:type == "pdf")
					silent execute "!pandoc " . @% . " -t beamer -o " . expand('%:r') . ".pdf"
				endif
			else
				echom "An argument to specify the output type is required (html/pdf)."
			endif
		endfunction
" Aliasing commands to this function to either HTML/PDF formats, then binding them to Leader keybinds.
	cnoreabbrev pdf call Pan("pdf")
	cnoreabbrev html call Pan("html")
	nnoremap	<Leader>p		:call Pan("pdf") <CR>
	nnoremap	<Leader>h		:call Pan("html") <CR>
