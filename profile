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

# Include my bin folder also
if [ -d "$HOME/bin" ]; then
	PATH="$PATH:$HOME/bin"
fi

#
# Functions
#

# Syncronize time with remote server
function synctime {
	sudo date -s "`curl -sI google.com | awk -F': ' '/Date: / {print \$2}'`"
}

# Get rid of mpv info messages and run it independent of terminal
function mp {
	command mpv "$@" &> /dev/null & disown
}

# Start new x display
function newX {
	# Check if x isn't started already
	if [ "$DISPLAY" == "" ]; then
		# by default start display :7
		[ $# -eq 0 ] && startx --:7: &
		# start display given
		[ $# -eq 1 ] && startx --:$1: &
	else
		echo "Display no $DISPLAY is already started."
	fi
}

#
# Startup Programs
#

# Print Space Invaders ANSI art
command $HOME/bin/spacex

# vi: ft=zsh:
