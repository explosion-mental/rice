# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b%(?..[%?]) "
setopt autocd autopushd # autocd with lowercase
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments
setopt HIST_IGNORE_ALL_DUPS # no duplicates
setopt HIST_SAVE_NO_DUPS    # no duplicates

# Load aliases and shortcuts if existent.
#[ -f "$HOME/.bash/aliases" ] && source "$HOME/.bash/aliases"
source "$HOME/.local/etc/aliases"

# History in cache directory:
HISTSIZE=999999
SAVEHIST=999999
HISTFILE=$HOME/.local/share/HISTORY
# Basic auto/tab complete:
autoload -U compinit
fpath=(~/.local/share/zshcomp $fpath)
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':make:*' tag-order 'targets'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

#Vi mode
# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q' ;;      # block
        viins|main) echo -ne '\e[5 q' ;; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# Yank to the system clipboard(xclip)
function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | xclip -sel c
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# binding for arrowkeys
#bindkey '^H' backward-kill-word
#bindkey "^[[1;5C" forward-word

autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -s '^f' 'vifmrun $PWD\n'
bindkey -s '^r' 'hf\n'
# bindkey -s '^?' '^H'
# bindkey -s '^H' '^?'

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
