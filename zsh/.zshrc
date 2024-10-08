# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
  node
  npm
  nvm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# SYSTEM ALIASES
# ----------------------------------------------
# get machine's ip address
alias ip="ipconfig getifaddr en0"

# CLI ALIASES
# ----------------------------------------------
alias out="cd .."
alias in="cd"
alias md="mkdir"
alias mfi="touch"
alias m="mv"
alias c="cp"
alias d="rm"
alias df="rm -r"
alias l="ls"
alias la="ls -a"
alias p="pwd"
alias cl="clear"
## man gives help guide to corresponding command
alias ma="man"

# NODE ALIASES
# ----------------------------------------------
## Specific to web dev bootcamp folder/file creation script.
alias nf="node create-dir.js" ## Followed by the folder name.

# HOMEBREW ALIASES
# ----------------------------------------------
alias bup="brew update && brew upgrade && brew cleanup && brew doctor"
alias blist="brew list"

# WSL/UBUNTU ALIASES
# ----------------------------------------------
alias distup="sudo apt-get update && sudo apt-get upgrade -y"

# ZSH/OH-MY-ZSH ALIASES
# ----------------------------------------------
# Install oh-my-zsh
alias omzinstall="sh -c '$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"
# Install oh-my-zsh
alias ozin="sh -c '$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"
# Update oh-my-zsh instances
alias ozup="omz update"
# edit global zsh configuration
alias zconf="code ~/.zshrc"
# reload zsh configuration
alias zsrc="source ~/.zshrc"
# reload zsh configuration
alias oz="cd ~/.oh-my-zsh"

# SSH ALIASES
# ----------------------------------------------
# navigate to global ssh directory
alias sshhome="cd ~/.ssh"
# edit global ssh configuration
alias sshconfig="code ~/.ssh/config"
## Follow key gen alias with your email address then you will be prompted for a filename i.e. personalaccount-github
alias skgen="ssh-keygen -t ed25519 -C"
## Start SSH agent
alias sagent="eval '$(ssh-agent -s)'"
## Add key to agent. Make sure you add filename created above to the end of this alias
alias sakey="ssh-add -K ~/.ssh/"
## Test your connection. Make sure you add your Host name created during the config file setup, to the end of this alias
alias stest="ssh -T git@"
## All info for ssh setup can be found at: https://www.darraghoriordan.com/2021/05/04/configure-multiple-github-accounts-one-computer/

# GULP ALIASES
# ----------------------------------------------
## Gulp Development Tasks
alias g="gulp"
alias gfr="gulp devFr"
## Gulp Build/Compile Tasks
alias gb="gulp build"
alias gbfr="gulp buildFr"
## Individual gulp tasks
alias gcl="gulp clean"
alias gw="gulp watchDev"

# GIT ALIASES
# ----------------------------------------------
# edit global git configuration
alias gconf="code ~/.gitconfig"
alias gcm="git add . && git commit -m" # Followed by message in quotes
alias gs="git status"
alias gpom="git push origin main"
## Create new branch
alias gcb="git checkout -b"
## Switch to branch specified after checkout
alias gsb="git checkout"
alias gc="git clone"
## Set upstream to push branch followed by name of branch
alias gus="git push --set-upstream origin"
alias gpu="git pull"
alias gp="git push"
alias gcache="git config --global credential.helper cache --timeout=3600"
## Run following when adding local repo to remote
### First, cd into local repo and add a README file.
#### echo "# name-of-repo" >> README.md
### Replace name-of-repo with the name of your repository
### Add git initialization to project
alias gin="git init"
### Stage README, created above.
alias gar="git add README.md"
### Commit changes
alias gcf="git commit -m 'first commit'"
### Make sure on main branch
alias gbm="git branch -M main"
### Add remote origin to local repo
### Make sure you add the remote URL after command using SSH config in place of git@github.com: to git@dgit:
alias grao="git remote add origin"
### Push local changes to remote main branch
alias gpom="git push -u origin main"

# NEXTJS ALIASES
# ----------------------------------------------
## Add name of project after nxtcna or nxtcnat
alias nxtcna="yarn create next-app"
alias nxtcnat="yarn create next-app --typescript"
alias nxtdev="yarn dev"
alias nxtbuild="yarn build && yarn export"
alias nxtstart="yarn start"
alias nxtlint="yarn lint"

# YARN ALIASES
# ----------------------------------------------
alias y="yarn"
alias yi="yarn init -y"
alias ya="yarn add"
alias yr="yarn remove"
alias yad="yarn add -D"
alias yga="yarn global add"
alias ygr="yarn global remove"
alias yu="yarn upgrade-interactive --latest"
alias ygu="yarn global upgrade"
alias yl="yarn list --depth=0"
alias ygl="yarn global list --depth=0"
alias yo="yarn outdated"
alias yei="yarn eslint --init"

# NPM ALIASES
# ----------------------------------------------
alias nconf="npm init @eslint/config"
alias ni="npm init"
alias nr="npm run"
alias nrb="npm run build"
alias nrs="npm run start"
alias nrl="npm run lint"
alias nrt="npm run test"
alias nrw="npm run watch"
alias nt="npm test"
alias nig="npm install -g"
alias nin="npm install"
alias nid="npm install --save-dev"
alias nie="npm install --save-dev --save-exact"
alias nun="npm uninstall"
alias ning="npm install -g"
alias nung="npm uninstall -g"
alias nu="npm update"
alias nri="npm run upgrade-interactive"
alias no="npm outdated"
alias np="npm prune"
alias nc="npm cache clean"
alias na="npm audit"
alias naf="npm audit fix"

# NODEMON ALIASES
# ----------------------------------------------
alias nd="nodemon"

# HUSKY ALIASES
# ----------------------------------------------
# Install Husky
alias hi="npx husky-init && yarn"