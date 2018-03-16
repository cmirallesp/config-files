# Path to your oh-my-zsh installation.
export ZSH=/Users/carles/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

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
#plugins=(git rails ruby taskwarrior)
alias zshconfig="subl ~/.zshrc"
alias envconfig="subl ~/Projects/config/env.sh"
#plugins=(git colored-man colorize github virtualenv pip python brew osx zsh-syntax-highlighting plugins elixir)
plugins=(git colored-man colorize github virtualenv pip python brew osx zsh-syntax-highlighting plugins rails)

# User configuration
export PATH="/opt/local/bin:/opt/local/sbin:/Users/carles/.rvm/gems/ruby-2.1.1/bin:/Users/carles/.rvm/gems/ruby-2.1.1@global/bin:/Users/carles/.rvm/rubies/ruby-2.1.1/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/local/smlnj/bin:/Users/carles/.rvm/bin:/usr/local/mysql/bin"
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
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

## SPRING
#alias s="spring"
#alias rc="s rails c"
#alias rs="s rails s"
#alias rk="s rake"
#alias dbstatus="rake db:migrate:status"

#alias restore_latest_dump_local="pg_restore --verbose --clean --no-acl --no-owner -h localhost -d nc_development latest.dump"
#alias prepare_test='RAILS_ENV=test db:drop db:create db:test:prepare'
#alias push_staging='git push staging +`git rev-parse --abbrev-ref HEAD`:master'
#alias copy_production_to_staging="heroku pg:backups restore `heroku pg:backups public-url -a novicap` DATABASE_URL -a novicap-staging"
#alias build_assets="rake assets:clean tmp:clear assets:precompile assets:sync"
#alias assets_sync="rake assets:sync" #TO S3

## MYSQL
MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

## HOOGLE
HOOGLE=/Users/carles/.local/bin
export PATH=$PATH:/Users/carles/.local/bin
alias ho=hoogle

## STACK ALIAS
alias se='stack exec --'
alias sb='stack build'
##anaconda
#export PATH=/Users/carles/anaconda2/bin:$PATH


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=".:/usr/local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
## fpath is a path for functions. this add zsh completions
fpath=(/usr/local/share/zsh-completions $fpath)
## init pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
alias vim='nvim'
# fuzzy finder
#export FZF_DEFAULT_COMMAND='rg --files --hidden --smartcase --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_COMPLETION_TRIGGER='//'

export MYVIMRC='.config/nvim/init.vim'

## GO
#export GOPATH=/Volumes/500GB/dev/go
export GOPATH=/Users/carles/dev/go
export PATH=$PATH:/usr/local/go/bin
eval "$(rbenv init -)"

## AMBER
alias adc='amber database create'
alias add='amber database drop'
alias adm='amber database migrate'
alias ads='amber database status'
alias adr='amber database rollback'
## term require for tmux with truecolor
export TERM="screen-256color-bce"
