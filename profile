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
alias wi='whatis'
alias py='python -q -S'

#
# Environment
#

# Don't save previously entered commands
setopt HIST_IGNORE_DUPS
# Don't save commands in history prepended with space
setopt HIST_IGNORE_SPACE

if [ "$TERM" != "dumb" ]; then

	# enable color support of ls
	[ -e "$HOME/.dir_colors" ] && DIR_COLORS="$HOME/.dir_colors"
	[ -e "$DIR_COLORS" ] || DIR_COLORS=""
	eval "`dircolors -b $DIR_COLORS`"

	# To have commands starting with `rm -rf` in red:
	ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'bg=red,bold')

fi

# Set default PS1 for VT
if [ "$TERM" = "linux" ]; then
	PS1="%B%F{red}%(?..%? )%f%b%B%F{red}%n%f%b@%m %B%40<..<%~%<< %b%(!.#.$) "
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


# Topcoder Arena launcher
function tc {
	javaws -Xignoreheaders -Xoffline -nosecurity -noupdate -headless -property user.home=$HOME/.config -jnlp $HOME/bin/tc.jnlp &> /dev/null &
}

# Start new x display
function newX {
	# Check if x isn't started already
	if [ "$DISPLAY" == "" ]; then
		# by default start display :7 OR
		[ $# -eq 0 ] && startx --:7: &
		# start display given
		[ $# -eq 1 ] && startx --:$1: &
	else
		echo "Display no. $DISPLAY is already started."
	fi
}

# Copy contents of file to Clipboard
function copy {
	if [ -f "$1" ]; then
		cat "$1" | xsel --clipboard --input
	fi
}

# Read TODO from todo file in $HOME directory
function todo {
	echo -e ' \e[0;37;41m TODO \e[0m'

	if [ -f $HOME/TODO ]; then
		let i=1
		while read t; do
			echo -e "\t\e[34m$i.\t\e[0;33m$t"; ((i++))
		done < $HOME/TODO
	fi

	echo -en '\e[0m'
}

#
# Startup Programs
#

# Print Space Invaders ANSI art
#command $HOME/bin/spacex

# Print TODO list
todo

# vi: ft=zsh:
