# Path to your oh-my-zsh installation.
export ZSH=/Users/raquelmoss/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="$USER"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
plugins=(git)

# User configuration

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


BUNDLER_EDITOR="nvim"

setopt correct

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Use p <project-name> to navigate to projects
p () {
  cd ~/Projects/$1
}

# Adds tab completion for p <project-name>
_p() { _files -W ~/Projects -/; }
compdef _p p

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias be="bundle exec"
alias r="rspec"
alias rspec="bundle exec rspec"
alias d="cd ~/Desktop"
alias rr="rake routes"
alias hhpush="git push heroku master && heroku run rake db:migrate"
alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
alias rubocop="bundle exec rubocop"
alias vim="nvim"
alias vi="nvim"
alias zsh_reload="source ~/.zshrc"
alias ez="vi ~/.zshrc"
alias rubocop="bundle exec rubocop --format simple"
alias plex="open http://$(ifconfig en0 | grep 'inet ' | cut -d' ' -f2):32400/web/index.html"

export FZF_DEFAULT_COMMAND='ag -l -g --hidden""'
export HAXE_STD_PATH="/usr/local/lib/haxe/std"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias gdc="gd --cached"

# added by travis gem
[ -f /Users/raquelmoss/.travis/travis.sh ] && source /Users/raquelmoss/.travis/travis.sh
