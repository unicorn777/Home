bindkey ""    transpose-chars
# Home
bindkey "\e[H"	beginning-of-line
bindkey "\e[1~"	beginning-of-line
bindkey ""		beginning-of-line	# Ctrl+A
# End
bindkey "\e[F"	end-of-line
bindkey "\e[4~"	end-of-line
bindkey ""		end-of-line		# Ctrl+E
# Delete
bindkey "\e[3~"	delete-char		# Delete

  bindkey "" history-incremental-search-backward # backward search in history

