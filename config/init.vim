func SaveAndRun()
	exec 'w'
	if &fitype == 'bash'
		exec '!bash %'
	elseif &fitype == 'python'
		exec '!python %'
	endif
endfunc

map <c-n> :call SaveRun()<cr>
map <F10> :e ~/.config/nvim/init.vim<cr>
