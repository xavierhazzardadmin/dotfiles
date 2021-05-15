cd ~
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#cd /home/xavierhazzardadmin/Dev
# Path to your oh-my-zsh installation.
export ZSH="/home/xavierhazzardadmin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#
# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Set list of themes to pick from when loading at random

# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )xxxxxx
# Set list of themes to pick from when loading at random
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zup="source ~/.zshrc"
alias rim="vim ~/.zshrc"
alias veim="vim ~/.vimrc"
alias c=clear
alias cls=clear
alias mon=nodemon
alias ls="ls -al"
alias apt="sudo apt"
function sysupdate {
	sudo apt update
	sudo apt upgrade
	sudo apt dist-upgrade
}

#  Web Development.
alias prettier="npm i --save-dev eslint eslint-config-prettier eslint-plugin-prettier"
#  Changes directory to main development environment.
alias dev="cd ~/Dev/"
#  Installs the eslint packages I use for javascript projects.
alias eslin="npm i --save-dev eslint-config-airbnb-base && cp ~/.eslintrc ."
#  Copies main prettier config file to current working directory.
alias pretty="cp ~/.prettierrc ."
#  Copies main eslint config file to current working directory.
alias eslrc="cp ~/.eslintrc ."
#  Copies eslint config file specially made for typescript projects into current working directory.
alias tsrc="cp ~/.tsrc/.eslintrc ."
#  Starts sass in watch mode.
alias saswatch="sass --watch source/styles/style.scss build/style.css"
#  Compiles sass files from source directory to build directory.
alias sasscomp="sass source/styles/style.scss build/style.css"
#  Installs the eslint packages for typescript in the current working directory.
alias tslin="npm install --save-dev eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint-config-airbnb-base typescript && cp ~/.tsrc/.eslintrc ."
#  Changes directory to typescript folder then clears the terminal output.
alias ts="cd ~/Dev/typescript && clear"
#  Initializes an express app inside the current folder.
alias expinit="npm i express && npm i --save-dev @types/express"
#  Starts the typescript compiler in watch mode.
alias typew="tsc -w"

#  Initializes the current working directory as a typescript project.
function tsinit {
    npm init -y
    tsc --init
    tslin
    pretty
    prettier
    touch index.ts
    vim index.ts
}

#  Initializes the current working directory as a typescript project without opening index in vim
function tsini {
    npm init -y
    tsc --init
    tslin
    pretty
    prettier
    touch index.ts
    vim index.ts
}

#  Creates a new folder and initializes it as a typecript project.
tsi () {
    mkdir "$1"
    cd "$1"
    tsinit
}

#  Creates a new directory and initializes it as a git repository using the git flow workflow.
gfl () {
    mkdir "$1"
    cd "$1"
    git init
    git flow init
    clear
}

#  Creates a new express project with the given name.
exp () {
    mkdir "$1"
    cd "$1"
    cp ~/.tsrc/express.ts .
    expinit
    tsinit
    prettier
    pretty
    echo "Happy Hacking!"
}

#  Creates a new React App with the given name, using the typescript template.
reactTS () {
    ts
    npx create-react-app "$1" --template typescript
    cd "$1"
}

reactT () {
    npx create-react-app "$1" --template typescript
    cd "$1"
}

add () {
    mkdir "$1"
    cd "$1"
}

#  Fixes the bash history when a BSOD occurs.
function fixHistory {
    mv .zsh_history .zsh_history_bad
    strings .zsh_history_bad > .zsh_history
    fc -R .zsh_history
}

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias updot="git add .zshrc .vimrc .tmux.conf .p10k.zsh .eslintrc .prettierrc .vim/coc-settings.json README.md -f"

alias stpr=mkdir
alias mongod="sudo mongod"
# alias docker="sudo docker"
# Fish syntax
# # set -gx FZF_DEFAULT_COMMAND  'rg --files --follow --hidden'
#stty -ixon

if [[ -t 0 && $- = *i* ]]
then
    stty -ixon
fi 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
