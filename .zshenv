# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
#export XDG_CACHE_HOME="$HOME/.local/cache"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="$HOME/.local/runtime"

# Custom directory (local variable)
DATA_ETC="$HOME/.local/etc"

# Paths
# Adds `~/.local/bin` to $PATH recursively
typeset -U path
path+=(~/.local/bin{,/**/*(N/)})
#export PATH=$PATH":$HOME/.bash/shell"
#Doom Emacs
export PATH=$PATH":${XDG_CONFIG_HOME:-$HOME/.config}/emacs/bin"

unsetopt PROMPT_SP

# Customs
export VISUAL="nvim"
export EDITOR="nvim"
export TERMINAL="st"
export WM="dwm"
export BROWSER="firefox"
#export BROWSER="surf"
#export PAGER="less"
export PAGER="less"
export READER="zathura"
export VIDEO="mpv"
export IMAGE="sxiv"
export COLORTERM="truecolor"
export OPENER="xdg-open"
# alias xs="xsel -b -l /tmp/.xsel"

# Clean up
export ZDOTDIR="$XDG_CONFIG_HOME/shell"
export INPUTRC="$DATA_ETC/inputrc"
export XINITRC="$DATA_ETC/xinitrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/.Xauthority"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/emulator
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export MYVIFMRC="$XDG_CONFIG_HOME/vifm/vifmrc"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
#export TMPDIR="/tmp"
export PYTHON_HISTORY_FILE="${XDG_DATA_HOME:-$HOME/.local/share}/python_history"
export PYTHONHISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/python_history"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
export MBSYNCRC="${XDG_CONFIG_HOME:-$HOME/.config}/mbsync/config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
# for dbus warnings (zathura makes them)
#export NO_AT_BRIDGE=1
# soyapps
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
#export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default setup_dxvk64"
#export ERRFILE=$HOME/.log/.xsession-errors
#export XFSM_VERBOSE=$HOME/.log/.xfce4-session.verbose-log

# Clipmenu, FZF, Pulsemixer and different args for programs, here!
export DICS="/usr/share/stardict/dic/"
export CM_SELECTIONS="clipboard"
export CM_LAUNCHER="rofi"
#export CM_HISTLENGTH=30
export PULSEMIXER_BAR_STYLE="╭╶╮╴╰╯◆◇· ──" # Pulsemixer actually show something
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm
export SUDO_ASKPASS="$HOME/.local/bin/dmenu/dmenupass"

# rawdrawandroid
export ANDROID_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/android-sdk"

# Less with colors
export LESSHISTFILE="-"
export LESS="-R --incsearch"
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
