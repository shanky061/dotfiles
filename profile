#
# Custom configuration of ZSH
#
# Author:
#   Shashank Chhikara <shanky061@gmail.com>
#

#
# Alias
#

# Some neat aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#
# Environment
#

# Don't save previously entered commands
setopt HIST_IGNORE_DUPS

if [ "$TERM" != "dumb" ]; then

	# enable color support of ls
	[ -e "$HOME/.dir_colors" ] && DIR_COLORS="$HOME/.dir_colors"
	[ -e "$DIR_COLORS" ] || DIR_COLORS=""
	eval "`dircolors -b $DIR_COLORS`"

	# To have commands starting with `rm -rf` in red:
	ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'bg=red,bold')
fi

#
# Functions
#

# Syncronize time with remote server
function synctime {
	sudo date -s "`curl -sI http://nist.time.gov | awk -F': ' '/Date: / {print \$2}'`"
}

# Get rid of mpv info messages and run it independent of terminal
function mp {
	command mpv "$@" &> /dev/null & disown
}

# vi: ft=zsh:
