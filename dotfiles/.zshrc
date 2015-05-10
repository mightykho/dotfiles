# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Create and checkout to branch #{nick}-#{original_branch}_#{specified_message}
branchit () {
  if [ $# -eq 0 ]
  then
    echo 'no branchname specified'
  else
    local branch_name=$(echo $* | sed -e 's/ /_/g')
    git checkout -b $(git config github.user)-$(git rev-parse --abbrev-ref HEAD)_$branch_name
  fi
}

# Drop all merged branches
brdrop () {
  git branch --merged | grep -v \* | xargs git branch -D
}
# FUUCK
alias fuck='$(thefuck $(fc -ln -1))'

# Trim linebreaks and copy to clipboard
alias clip="tr -d '\n' | pbcopy"

# Flush DNS
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Get OS X Software Updates and Homebrew formulas
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; (cd ~/.vim && rake)'

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# ctags
alias update_ctags="ctags -R -f .tags ."

# Make folder and go to it
mkcd() { mkdir -p "$1" && cd "$1" }

# Config files aliases
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias vimrc.before="vim ~/.vimrc.before"
alias vimrc.after="vim ~/.vimrc.after"
alias tmux.conf="vim ~/.tmux.conf"
alias gitconfig="vim ~/.gitconfig"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux)
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
# User configuration
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export EDITOR='vim'
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

