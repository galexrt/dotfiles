# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/.bin:/home/atrost/.gem/ruby/2.4.0/bin"

# Path to your oh-my-zsh installation.
 export ZSH=/home/atrost/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="rkj-repos"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git systemd docker common-aliases history-substring-search zsh-syntax-highlighting vagrant go kubectl pass rsync mc)

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Special zsh settings
setopt NO_BEEP

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

#export TERM='rxvt'
export TERM='xterm'
unset BROWSER

# Preferred editor for local and remote sessions
export EDITOR='vim'
export VISUAL='vim'

# Token
export GITHUB_TOKEN="YOUR_GITHUB_TOKEN"

export GITLAB_TOKEN="YOUR_GITLAB_TOKEN"

export QUAY_LOGIN="YOUR_QUAYIO_USERNAME" \
    QUAY_EMAIL="YOUR_QUAYIO_EMAIL" \
    QUAY_PASSWORD="YOUR_QUAYIO_PASSWORD_TOKEN"

export DOCKER_LOGIN="YOUR_DOCKER_HUB_USERNAME" \
    DOCKER_EMAIL="YOUR_DOCKER_HUB_EMAIL" \
    DOCKER_PASSWORD="YOUR_DOCKER_HUB_PASSWORD"

export GPG_TTY=$(tty)
# Cloudflare token
export CF_API_KEY="YOUR_CLOUDFLARE_API_KEY" \
    CF_API_EMAIL="YOUR_CLOUDFLARE_API_EMAIL"
# Ansible options
export ANSIBLE_COW_SELECTION=small

# Development and/or Compilation flags
# export ARCHFLAGS="-arch x86_64"
export GOPATH="/home/atrost/Projects/workspace/go"
export PATH="$PATH:$GOPATH/bin"

#bindkey "^[[2~" yank                    # Insert
#bindkey "^[[3~" delete-char             # Del
#bindkey "^[[5~" up-line-or-history      # PageUp
#bindkey "^[[6~" down-line-or-history    # PageDown
#bindkey "^[e"   expand-cmd-path         # C-e for expanding path of typed command.
#bindkey "^[[A"  up-line-or-search       # Up arrow for back-history-search.
#bindkey "^[[B"  down-line-or-search     # Down arrow for fwd-history-search.
#bindkey " "     magic-space             # Do history expansion on space.
#case "$TERM" in
#        linux|screen)
#                bindkey "^[[1~" beginning-of-line       # Pos1
#                bindkey "^[[4~" end-of-line             # End
#        ;;
#        *xterm*|(dt|k)term)
#                bindkey "^[[H"  beginning-of-line       # Pos1
#                bindkey "^[[F"  end-of-line             # End
#                bindkey "^[[7~" beginning-of-line       # Pos1
#                bindkey "^[[8~" end-of-line             # End
#        ;;
#        rxvt|Eterm)
#                bindkey "^[[7~" beginning-of-line       # Pos1
#                bindkey "^[[8~" end-of-line             # End
#        ;;
#esac

#bindkey "${terminfo[khome]}" beginning-of-line
#bindkey "${terminfo[kend]}" end-of-line

##Set some keybindings
###############################################
typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[7~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[8~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char
bindkey '^[[2~' overwrite-mode
#################################################

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Set some aliases
alias zshconfig="vim ~/.zshrc"
alias sshconfig="vim ~/.ssh/config"
alias sshknown_hosts="vim ~/.ssh/known_hosts"
alias i3config="vim ~/.i3/config"
alias vimrc="vim ~/.vimrc"
alias Xresources="vim ~/.Xresources ~/.extend.Xresources"
alias kubeconfig="vim ~/.kube/config"

alias kubectl='kubectl --kubeconfig=/home/atrost/.kube/config '
alias sleep1='sleep 1'

alias psfaux='ps faux'
alias psaux='ps aux'

alias pingGDNSA='ping 8.8.8.8'
alias pingGDNSB='ping 8.8.4.4'
alias ISMYINTERNETK='ping 8.8.8.8'
# FIX STEAM THE HARD WAY FTW!!
alias rmbadsteamlibs='find ~/.steam/root/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete; find ~/.local/share/Steam/ \( -name "libgcc_s.so*" -o -name "libstdc++.so*" -o -name "libxcb.so*" \) -print -delete'

alias toClipboard='xclip -selection c'
alias bfg='java -jar /home/atrost/Scripts/bfg-1.12.15.jar '
alias 'git commit'='git commit -s '

i3-get-window-criteria() {
    PROGNAME=$(basename "$0")

    # Check for xwininfo and xprop
    for cmd in xwininfo xprop; do
        if ! which $cmd > /dev/null 2>&1; then
            echo "$PROGNAME: $cmd: command not found" >&2
            exit 1
        fi
    done

    match_int='[0-9][0-9]*'
    match_string='".*"'
    match_qstring='"[^"\\]*(\\.[^"\\]*)*"' # NOTE: Adds 1 backreference

    {
        # Run xwininfo, get window id
        window_id=$(xwininfo -int | sed -nre "s/^xwininfo: Window id: ($match_int) .*$/\1/p")
        echo "id=$window_id"

        # Run xprop, transform its output into i3 criteria. Handle fallback to
        # WM_NAME when _NET_WM_NAME isn't set
        xprop -id $window_id |
            sed -nr \
                -e "s/^WM_CLASS\(STRING\) = ($match_qstring), ($match_qstring)$/instance=\1\nclass=\3/p" \
                -e "s/^WM_WINDOW_ROLE\(STRING\) = ($match_qstring)$/window_role=\1/p" \
                -e "/^WM_NAME\(STRING\) = ($match_string)$/{s//title=\1/; h}" \
                -e "/^_NET_WM_NAME\(UTF8_STRING\) = ($match_qstring)$/{s//title=\1/; h}" \
                -e '${g; p}'
    } | sort | tr "\n" " " | sed -r 's/^(.*) $/[\1]\n/'
}
makemygopath() {
    export GO15VENDOREXPERIMENT=1
    export GOPATH="$(pwd)"
    export PATH="$PATH:$GOPATH/bin"
}
makemygopathextreme() {
    export GO15VENDOREXPERIMENT=1
    export GOPATH="$(pwd)"
    export PATH="$PATH:$GOPATH/bin"
    atom .
}
transfer() {
    # check arguments
    if [ $# -eq 0 ];
    then
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi

    # get temporarily filename, output is written to this file show progress can be showed
    tmpfile=$( mktemp -t transferXXX )

    # upload stdin or file
    file=$1

    if tty -s;
    then
        basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

        if [ ! -e $file ];
        then
            echo "File $file doesn't exists."
            return 1
        fi

        if [ -d $file ];
        then
            # zip directory and transfer
            zipfile=$( mktemp -t transferXXX.zip )
            cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            # transfer file
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
        fi
    else
        # transfer pipe
        curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    fi

    # cat output link
    cat $tmpfile

    # cleanup
    rm -f $tmpfile
}
IMALIVE() {
    ADDRESS="$1"
    while true; do
        fping -c 1 "$ADDRESS" > /dev/null 2&>1;
        if (( $? == 0 )); then
            notify-send "=> HOST ALIVE: $ADDRESS" -t 12
            return 0
        fi
	sleep 1
    done
}
yt-dl-mp3() {
    if [ -z "$1" ]; then
        return 2
    fi
    youtube-dl -x --audio-format mp3 -f bestvideo+bestaudio --audio-quality 0 "$1"
}
mkpasswd() {
    length="$1"
    if [ -z "$length" ]; then
        length="20"
    fi
    < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$length} | sed 's/-/_/';echo;
}
initsshkeyaccess() {
    echo "> Adding ssh keys"
    echo "-> YOUR_FIRST_SSH_KEY"
    ssh-add ~/.ssh/YOUR_FIRST_SSH_KEY
    echo "-> YOUR_SECOND_SSH_KEY"
    ssh-add ~/.ssh/YOUR_SECOND_SSH_KEY
    echo "> Added ssh keys."
}
initgpgkeyaccess() {
    echo "> Unlocking GPG keys"
    for key in "YOUR_FIRST_GPG_KEY" "YOUR_SECOND_GPG_KEY"; do
        echo "-> $key"
        echo "1234" | gpg -o /dev/null --local-user "$key" -as - && echo "-> $key unlocked"
    done
    echo "> Unlocked GPG keys."
}
FIXTHEFUCKINGCPU() {
    sudo cpupower frequency-set -r -g performance
}
CALMYOURTITSCPU() {
   sudo cpupower frequency-set -r -g powersave
}
killnamed() {
    if [ -z "$1" ]; then
        echo "No name to kill given."
        return 2;
    fi
    echo "=> Killing all processes containging \"$1\""
    for id in $(pgrep "$1" | awk '{ print $2 }'); do
        echo "-> Killed $id"
        kill $id 2>&1
    done
    echo "=> Done."
}
forceLoadKernelModules() {
    for file in /lib/modules-load.d/* /usr/lib/modules-load.d/* /etc/modules-load.d/*; do
        if [[ "$(basename $file)" == '*' ]]; then
            continue
        fi
        while IFS='' read -r line || ([[ -n "$line" ]]); do
            if echo $line | grep -q '^#'; then
                continue;
            fi;
            echo "-> Loading module $line"
            sudo modprobe -f ${line}
        done < "$file"
    done
}

[ -f /tmp/KEY_ACCESS_GRANTED ] || {
    initsshkeyaccess;
    initgpgkeyaccess;
    touch /tmp/KEY_ACCESS_GRANTED;
}

# Completions
source <(stern --completion=zsh)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null' \
    FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND" \
    FZF_DEFAULT_OPTS="--inline-info --height 20% --reverse --border --no-mouse"
