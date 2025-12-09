# ----------------------------------------------
# PATH VARIABLES
# ----------------------------------------------

# SETTING EXECUTABLE PATHS
# ----------------------------------------------
export PATH="$HOME/.local/bin:$PATH"

# LOAD PYENV
# ----------------------------------------------
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"

# ----------------------------------------------
# OH-MY-POSH CONFIGURATION & THEME
# - Favourite themes: chips.omp.json, cloud-native-azure.omp.json, froczh.omp.json, iterm2.omp.json, jandedobbeleer.omp.json, jblab_2021.omp.json, kushal.omp.json, mojada.omp.json, montys.omp.json, quick-term.omp.json, sonicboom_light.omp.json, wholespace.omp.json
# ----------------------------------------------
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  # eval "$(oh-my-posh init zsh)"
  # eval "$(oh-my-posh init zsh --config ~/jandedobbeleer.omp.json)"
  # eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/cloud-native-azure.omp.json)"
  # FOR WINDOWS WSL
  eval "$(oh-my-posh init zsh --config ~/.cache/oh-my-posh/themes/cloud-native-azure.omp.json)"
fi

# ----------------------------------------------
# PATH TO OH-MY-ZSH INSTALLATION
# ----------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

# ----------------------------------------------
# ZSH PLUGINS
# ----------------------------------------------
plugins=(
  git
  node
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# ----------------------------------------------
# SOURCE OH-MY-ZSH
# ----------------------------------------------
source $ZSH/oh-my-zsh.sh

# ----------------------------------------------
# ALIASES & FUNCTIONS
# ----------------------------------------------

# MACOSX
# ----------------------------------------------
macInit() {
  echo "Show Library folder on your Mac. 📂"
  chflags nohidden ~/Library
  echo "***************************************************"
  echo "Do not open previous previewed files (e.g. PDFs) when opening a new one. 📄"
  defaults write com.apple.Preview ApplePersistenceIgnoreState YES
  echo "***************************************************"
  echo "Save screenshots as JPG instead of PNG to save space. 📸"
  defaults write com.apple.screencapture type jpg
  echo "***************************************************"
  echo "Show hidden files in Finder. 👻"
  defaults write com.apple.finder AppleShowAllFiles YES
  echo "***************************************************"
  echo "Show status bar in Finder window. 📊"
  defaults write com.apple.finder ShowPathbar -bool true
  echo "***************************************************"
  echo "Show path bar in Finder window. 🛣️"
  defaults write com.apple.finder ShowStatusBar -bool true
  echo "***************************************************"
  echo "Restarting Finder to apply changes... 🔄"
  killall Finder;
  echo "***************************************************"
  echo "DONE! 😃"
} # Show hidden folders in MacOSX as well as other configs

macDockSp() {
  echo "Adding a small space to the dock... 🛳️"
  defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}' && killall Dock
} # Adds a small spacer to the MacOSX dock to help with organization.

macDockRm() {
  echo "Removing all spacers from the dock... 🛳️"
  defaults write com.apple.dock persistent-apps -array && killall Dock
} # Removes all spacers from the MacOSX dock.

# CLI/GENERAL
# ----------------------------------------------
alias up="echo -e 'Going up a directory, boiiii! 🛸\n\n' && cd .." # Up one directory.
alias la="echo -e 'Ooooo, piece a candy! 🍬\n\n' && ls -a" # Lists all contents including hidden files and admin permissions.
alias pd="echo -e 'Where are we again? 😳\n\n' && pwd" # Displays your current directory.
alias cl="echo -e 'Time to clean up, it is messy in here!! 🧹\n\n' && clear" # Clears terminal/command window.
alias ow="code -r" # Open project in same vscode window. Make sure you navigate to said dir and append with a period.

make() {
  echo "Let us create a folder then enter it!"
  if [ ! -n "$1" ]; then
    echo "*************************************************"
    echo "Enter a directory name, silly! 😠😠"
    echo "*************************************************"
  elif [ -d $1 ]; then
    echo "*************************************************"
    echo "\`$1' already exists, oh my! 🫣🫣"
    echo "*************************************************"
  else
    mkdir $1 && cd $1
  fi
} # Create a directory and cd into it.

# HOMEBREW
# ----------------------------------------------
alias bl="echo -e 'Let us see what brews you have in your collection. 📚\n\n' && brew list" # Lists all Homebrew packages.
alias blc="echo -e 'Let us see what casks you have in your collection. 📚\n\n' && brew list --cask" # Lists all Homebrew casks.
alias bar="echo -e 'Time to clean up those old brews! 🍺🧹\n\n' && brew autoremove" # Removes any outdated Homebrew packages and dependencies.

bi() {
  echo -e 'Let us install a brew package. \n\n'
  brew install "$@"
} # Installs a Homebrew package.

bui() {
  echo -e 'Let us uninstall a brew package. \n\n'
  brew uninstall "$@"
} # Uninstalls a Homebrew package.

bic() {
  echo -e 'Let us install a brew cask. \n\n'
  brew install "$@" --cask
} # Installs a Homebrew cask.

buic() {
  echo -e 'Let us uninstall a brew cask. \n\n'
  brew uninstall "$@" --cask
} # Uninstalls a Homebrew cask.

binf() {
  echo "***************************************************"
  echo "Installing nerd font: font-$1-nerd-font 🤓\n\n"
  echo "***************************************************"
  brew install --cask "font-$1-nerd-font"
} # Installs nerd font. Tested on linuxbrew install Windows WSL2.

brewUp() {
  echo "Your brew is looking a bit sour, better refresh that! 🍻🍻"
  echo "***************************************************"
  echo "Updating taps. 🔧🛁"
  echo "***************************************************"
  brew update
  echo "***************************************************"
  echo "Upgrading formulae. 📝📝"
  echo "***************************************************"
  brew upgrade
  echo "***************************************************"
  echo "Fixing any errors and clearing outdated files. 🏥🌡️"
  echo "***************************************************"
  brew doctor
} # Updates/upgrades Homebrew packages, removes outdated files, and check system for problems.

# UBUNTU / LINUX
# ----------------------------------------------
alias -g uup="echo -e 'Your linux packages are looking a bit dated... 👴\n\n' && sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove" # Updates/upgrade linux packages and prompt "yes" anytime command asks for it.
alias lroot="sudo chown root: $1" # Give root ownership to file or folder. Append name of file or folder.
alias l600="sudo chmod 600 $1" # Give 600 permissions (read/write) to file or folder. Append name of file or folder.
alias l775="sudo chmod 775 $1" # Give 775 (all: read/write/execute) permissions to file or folder. Append name of file or folder.
alias lid="id $1" # Get UID and PID for user. Append with username.
alias lg=" | grep $1" # See if this works. Basically I want to filter out results based on keyword ($1). This should be added to end of command.
alias lsdrive="sudo blkid" # List storage devices with ID.

usl(){
  ln -s /home/$1 /home/$2
} # Create a symlink in WSL Ubuntu. First variable starts at the WSL username and ends at the repo file target. The second variable starts at the WSL username and ends at the root file (i.e. zshrc).

uslo(){
  ln -sf /home/$1 /home/$2
} # Same as above, but it will overwrite the source (second argument) if the file already exists.

uck(){
  ls -l /home/$1
} # Check if a file has an existing symlink. Make sure the variable starts at the username and ends at the file source (i.e. /home/gingaranga/.zshrc).

urm(){
  rm $1
} # Removes a symlink. The variable needs to be replaced with the name of the symlink or the second argument when creating the symlink (i.e. .zshrc).

uul(){
  unlink $1
} # Unlinks a symlink. The variable needs to be replaced with the name of the symlink or the second argument when creating the symlink (i.e. .zshrc). This leaves the file, but removes the symlink.

# ZSH/OH-MY-ZSH
# ----------------------------------------------
alias zed="echo -e 'Editing your ZSH config, eh? 👨‍🔬\n\n' && code ${HOME}/.zshrc" # Edit global ZSH config.
alias zre="echo -e 'It is annoying, but we have to refresh the config EVERYTIME we make a change... 🙃\n\n' && source ${HOME}/.zshrc" # Reloads ZSH config after changes.

zshSet() {
  echo "Get ready for some linuxy goodness!! 🍕🍕"
  echo "***************************************************"
  echo "First, let us check to see if ZSH is installed. 🤔👓"
  echo "***************************************************"
  zsh --version
  echo "***************************************************"
  echo "Set ZSH as the default shell! 😀😀"
  echo "***************************************************"
  chsh -s $(which zsh)
  echo "***************************************************"
  echo "Install Oh My ZSH!! 🤩🤩"
  echo "***************************************************"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
} # Check if ZSH is installed, set ZSH as the default shell, and then install Oh My ZSH.

zadd() {
  if [ -z "$1" ]; then
    echo "***************************************************"
    echo "Please provide the text you want to add! 📝"
    echo "Usage: zadd 'export PATH=...'"
    echo "***************************************************"
    return 1
  fi

  echo "***************************************************"
  echo "Appending to .zshrc... ✍️"
  echo "***************************************************"
  echo "$1" >> "${HOME}/.zshrc"

  echo "***************************************************"
  echo "Reloading configuration... 🔄"
  echo "***************************************************"
  source "${HOME}/.zshrc"

  echo "***************************************************"
  echo "Done! Entry added and config reloaded. ✅"
  echo "***************************************************"
} # Appends a line to .zshrc and reloads the config.

# SSH KEYS
# ----------------------------------------------
alias shao="echo -e 'Making sure you are in the correct directory before creating some SSH stuff! 🔍\n\n' && cd ${HOME}/.ssh" # Navigate to global ssh directory.
alias shacon="echo -e 'Open that config... SHHHHH! 🤫\n\n' && code ${HOME}/.ssh/config" # Edit global ssh configuration using vscode.
alias shagen="echo -e 'The key to your heart :) 💞\n\n' && ssh-keygen -t ed25519 -C $1" # Creates a local SSH key if followed by filename (i.e. personal-github).
alias shagent="echo -e 'I do not know what this is, but we gotta do it or else the next step will not work... 😕\n\n' && eval '$(ssh-agent -s)'" # Starts SSH agent.
alias shakey="echo -e 'The name is Bond, James Bond... and I need that key! 🔑\n\n' && ssh-add --apple-use-keychain ${HOME}/.ssh" # TODO: Figure out how to add this alias with variable because the forward slash throws it off.
# Adds SSH key to agent. Make sure you add filename created with skgen alias to the end of this alias. ** For Windows/WSL you need to remove "UseKeychain from SSH config and -K/--apple-use-keychain from this code."
alias shatest="echo -e 'Did it work?? ✋\n\n' && ssh -T git@$1" # Test your connection. Make sure you add your Host name created during the config file setup, to the end of this alias.

# GULP
# ----------------------------------------------
alias gu="echo -e 'GULP! 😧\n\n' && gulp" # Runs gulp command.
alias gufr="echo -e 'LES GULP!? 👨‍🎨\n\n' && gulp devFr" # Runs French gulp command.
alias gut="echo -e 'Let us check out that work! 🤑\n\n' && gulp --template $1" # Runs development task on HTML template if followed by template name. If none provided, default.html template will be used.
alias gutfr="echo -e 'Tu es... Grande poulette! 👨‍🎨\n\n' && gulp devFr --template $1" # Runs French development task on HTML template if followed by template name. If none provided, default.html template will be used.
alias gub="echo -e 'Well you are just a cute little Bob the builder! 👷‍♂️\n\n' && gulp build" # Runs build tasks.
alias gubfr="echo -e 'Es que je puis aller aux toilettes! 👨‍🎨\n\n' && gulp buildFr" # Runs the French build tasks.
alias gucl="echo -e 'Clean up, clean up, everybody clean up! 🎵\n\n' && gulp clean" # Runs the clean or delete task for dev and prod directories.

# GIT/GITHUB
# ----------------------------------------------
alias gl="git log --graph --oneline --decorate" # Provides a graph of the git log.
alias gs="echo -e 'All right! What is going on here? 😕\n\n' && git status" # Provides git status.
alias gpu="echo -e 'What are they doing up there? Pull it down! 😶‍🌫️\n\n' && git pull" # Pulls changes from remote branch to local.
alias gr="echo -e 'Let us see those remote repositories! 🌍\n\n' && git remote -v" # View remote repositories.
alias gb="echo -e 'Branches are like trees, let us see them all! 🌲🌲\n\n' && git branch -a" # View all branches (local and remote).

gp() {
  local remote=${1:-origin}
  local branch=${2:-main}
  echo -e "Alright, we done. Push it up to $remote/$branch! 🫷⬆️\n\n"
  git push "$remote" "$branch"
} # Pushes local changes to remote (default: origin) and branch (default: main).

gc() {
  local repo_name=$1
  local username=${2:-evanmarshall-dev}
  local ssh_alias=${3:-dgit}

  if [ -z "$repo_name" ]; then
    echo "Error: Repository name is required."
    echo "Usage: gc <repo-name> [username] [ssh-alias]"
    return 1
  fi

  echo -e "Let us The Sixth Day this shhhh! 🕕\n\n"
  git clone "git@$ssh_alias:$username/$repo_name.git"
} # Clones a remote repo using SSH alias. Usage: gc <repo-name> [username] [ssh-alias]

gcb() {
    echo -e 'A new branch is sprouting on your Git tree 🌳\n\n'
    git checkout -b "$1"
} # Switch to and create branch. Append branch name to the end of this function.

gsb() {
    echo -e 'Let us climb to that branch! 🌴\n\n'
    git checkout "$1"
}

gitUnstage() {
  git reset HEAD "$1" && git rm --cached -r "$1"
} # Pass any file or directory as an argument to remove cached staging changes for said file/dir being added to .gitignore (i.e. gitunstage path/to/file.txt or gitunstage out/).

gitCom() {
  echo "You have done some great work! Now let us send that up to the repo for safe keeping. ✅✅"
  echo "***************************************************"
  echo "First, let us check the status of the local work vs remote repo. 🌱🌱"
  echo "***************************************************"
  git status
  echo "***************************************************"
  echo "Then, let us add all of the changed files to staging. 🪜🪜"
  echo "***************************************************"
  git add .
  echo "***************************************************"
  echo "Now, checking to see if you created a commit message. ❓❓"
  echo "***************************************************"
  if [ ! -n "$1" ]; then
    echo "*************************************************"
    echo "No commit message provided. Opening editor... 📝"
    echo "*************************************************"
    git commit # This will open VS Code (or your configured editor)
  else
    echo "*************************************************"
    echo "Great message! Committing now. 🗒️🗒️"
    echo "*************************************************"
    git commit -m "$1" # Use the provided message, properly quoted
  fi
  # Check if the commit was successful before pushing.
  if [ $? -eq 0 ]; then
    echo "***************************************************"
    echo "Commit successful. All checks cleared, pushing now! ⬆️⬆️"
    echo "***************************************************"
    git push
  else
    echo "***************************************************"
    echo "Commit failed or was aborted. Not pushing."
    echo "***************************************************"
  fi
  echo "***************************************************"
  echo "Let us get some details about the latest commit. 🖨️🖨️"
  echo "***************************************************"
  git log --graph --oneline --decorate
} # Adds all changed files to staging and generates a commit with message. Append the git commit message to the end of this function alias within quotes. If all checks passed, it then pushes to remote repo.

gitConnectNew() {
  echo "Let's connect your local project to a new remote GitHub repo! ��"
  echo "***************************************************"

  # Prompt for project name (required)
  echo "Enter the project name (this will be the repo name): "
  read project_name
  if [ -z "$project_name" ]; then
    echo "❌ Project name is required. Exiting..."
    return 1
  fi

  # Prompt for SSH alias (default: dgit)
  echo "***************************************************"
  echo "Enter SSH alias (default: dgit): "
  read ssh_alias
  ssh_alias=${ssh_alias:-dgit}

  # Prompt for GitHub username (required)
  echo "***************************************************"
  echo "Enter GitHub username: "
  read github_username
  if [ -z "$github_username" ]; then
    echo "❌ GitHub username is required. Exiting..."
    return 1
  fi

  # Prompt for README header (default: project name)
  echo "***************************************************"
  echo "Enter README header content (default: $project_name): "
  read readme_header
  readme_header=${readme_header:-$project_name}

  # Prompt for commit message (default)
  echo "***************************************************"
  echo "Enter commit message (default: init: Initial git initialization with project name as header.): "
  read commit_message
  commit_message=${commit_message:-"init: Initial git initialization with project name as header."}

  echo "***************************************************"
  echo "📋 Summary:"
  echo "  Project: $project_name"
  echo "  SSH Alias: $ssh_alias"
  echo "  GitHub User: $github_username"
  echo "  README Header: $readme_header"
  echo "  Commit Message: $commit_message"
  echo "  Remote URL: git@$ssh_alias:$github_username/$project_name.git"
  echo "***************************************************"
  echo "Continue? (y/n): "
  read confirm
  if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "❌ Cancelled by user."
    return 1
  fi

  echo "***************************************************"
  echo "Step 1: Creating README.md with custom header 📖📖"
  echo "***************************************************"
  echo "# $readme_header" > README.md
  if [ $? -ne 0 ]; then
    echo "❌ Failed to create README.md"
    return 1
  fi
  echo "✅ README.md created successfully"

  echo "***************************************************"
  echo "Step 2: Initializing git repository 📂📂"
  echo "***************************************************"
  git init
  if [ $? -ne 0 ]; then
    echo "❌ Failed to initialize git repository"
    return 1
  fi
  echo "✅ Git repository initialized"

  echo "***************************************************"
  echo "Step 3: Adding README.md to staging 👩‍🎤👩‍🎤"
  echo "***************************************************"
  git add README.md
  if [ $? -ne 0 ]; then
    echo "❌ Failed to add README.md to staging"
    return 1
  fi
  echo "✅ README.md added to staging"

  echo "***************************************************"
  echo "Step 4: Creating initial commit 🗒️🗒️"
  echo "***************************************************"
  git commit -m "$commit_message"
  if [ $? -ne 0 ]; then
    echo "❌ Failed to create commit"
    return 1
  fi
  echo "✅ Initial commit created"

  echo "***************************************************"
  echo "Step 5: Setting default branch to main 🌳🌳"
  echo "***************************************************"
  git branch -M main
  if [ $? -ne 0 ]; then
    echo "❌ Failed to set branch to main"
    return 1
  fi
  echo "✅ Default branch set to main"

  echo "***************************************************"
  echo "Step 6: Adding remote origin ��"
  echo "***************************************************"
  git remote add origin git@$ssh_alias:$github_username/$project_name.git
  if [ $? -ne 0 ]; then
    echo "❌ Failed to add remote origin"
    return 1
  fi
  echo "✅ Remote origin added"

  echo "***************************************************"
  echo "Step 7: Pushing to remote repository ⬆️⬆️"
  echo "***************************************************"
  git push -u origin main
  if [ $? -ne 0 ]; then
    echo "❌ Failed to push to remote repository"
    return 1
  fi

  echo "***************************************************"
  echo "🎉 SUCCESS! Local project connected to remote repo!"
  echo "Repository: https://github.com/$github_username/$project_name"
  echo "***************************************************"
} # Connect a local project to a new remote GitHub repo with interactive prompts for all parameters, custom README header, and comprehensive error handling.

# GitHub commands to craft a good commit message. # TODO: Create a function that uses these commands to help create a good commit message.
# Show branch and short status
# ? git status -sb

# See what changed (unstaged)
# ? git diff --stat
# ? git diff --name-only

# See what’s staged (if any)
# ? git diff --cached --stat
# ? git diff --cached --name-only

# Recent history for context
# ? git log --oneline -n 5

# VITE
# ----------------------------------------------
cva() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Both an app name and a template are required."
    echo "Usage: cva <app-name> <template-name>"
    echo "Example: cva my-react-app react"
    return 1
  fi
  pnpm create vite "$1" --template "$2"
} # Create a Vite app, requiring both an app name and a template (e.g., react, vue, svelte).

# NEXT.JS
# ----------------------------------------------
nxi() {
  local package_manager=$1
  local version=${2:-latest}
  npx create-next-app@$version --use-$package_manager
} # Launch create next app dialog. Append arguments for package manager and next.js version (If no version provided then it defaults to latest).

# PNPM
# ----------------------------------------------
alias pw="where pnpm" # Shows where pnpm is installed on your system. When doing a fresh install, remove all instances of it with rm -rf /path-to-install.
alias p="pnpm" # Alias for pnpm.
alias pi="pnpm install" # Installs all dependencies in the package.json.
alias pig="npm install -g pnpm@latest-10" # Installs pnpm package manager globally using curl.
alias pr="pnpm uninstall '$1'" # Append this command with the package name you would like to remove.
alias prg="pnpm uninstall -g '$1'" # Append this command with the global package name you would like to remove.
alias pad="pnpm install g '$1'" # Append this command with the package name to install it globally.
alias pu="pnpm self update" # Updates your instance of pnpm package manager.
alias pup="pnpm up" # To update packages to latest specified versions in package.json.
alias pulp="pnpm up --latest" # Same as above, but ignoring package.json.
alias pd="pnpm dlx '$1'" # Append this command with the package you would like to install via binaries, alternative to npx.

# FFMPEG
# ----------------------------------------------
alias ffc="ffmpeg -i $1 $2" # Replace $1 and $2 with input file and output file, respectively to convert $1 into $2.
alias ffs="ffmpeg -i $1.srt big.ass"
alias ffsub="ffmpeg -i $1 -vf ass=big.ass $2" # Takes the above created ass file and adds it as a subtitle to video file $1. The output is the $2 argument.

# GARUDA LINUX/ARCH
# ----------------------------------------------
alias pacfind="sudo pacman -Ss $1" # Search for a package in the repositories.
alias pacin="sudo pacman -S $1" # Install a package.
alias pacrm="sudo pacman -Rns $1" # Remove a package.
alias pacup="sudo pacman -Sy" # Update package database.
alias sysu="sudo pacman -Syu" # Full system upgrade.
alias pacls="pacman -Q $1" # List installed packages.

# PYTHON/PYENV
# ----------------------------------------------
alias pyei="brew install pyenv" # Install pyenv using Homebrew.
alias pyi="pyenv install $1" # Install a specific Python version using pyenv. Append with version number.
alias pyu="pyenv uninstall $1" # Uninstall a specific Python version using pyenv. Append with version number.
alias pyv="pyenv versions" # List all installed Python versions.
alias pygl="pyenv global $1" # Set the global Python version. Append with version number.
alias pyl="pyenv local $1" # Set the local Python version for the current directory. Append with version number.
alias pysh="pyenv shell $1" # Set the shell-specific Python version. Append with version number.

# PIP/PIPENV
# ----------------------------------------------
pipi() {
    pip install "$@" --user
} # Install a Python package using pip and the --user flag to avoid permission issues. The $@ allows for multiple package names to be passed.
pipu() {
  pip uninstall "$@" --user
} # Uninstall a Python package using pip
alias pipug="pip install --upgrade pip" # Upgrade pip to the latest version
alias pipl="pip list" # List all installed Python packages using pip
pipei() {
  pipenv install "$@"
} # Install a package using pipenv. The $@ allows for multiple package names to be passed. Make sure you run these commands within a local project and not globally.
alias pipea="pipenv shell" # Activate the pipenv shell for the current project.
alias piped="exit" # Deactivate the pipenv shell.

# POSTGRESQL
# ----------------------------------------------
pgi() { brew install postgresql@$1; } # Install a specific PostgreSQL version using Homebrew. Append with version number.
pgl() { brew link postgresql@$1; } # Link a specific PostgreSQL version. Append with version number.
pgs() { brew services start postgresql@$1; } # Start PostgreSQL service for a specific version. Append with version number.
pgst() { brew services stop postgresql@$1; } # Stop PostgreSQL service for a specific version. Append with version number.
alias pgdb="createdb" # Create a new PostgreSQL database. Append with database name.

# Or, if you don't want/need a background service you can just run:
# LC_ALL="en_US.UTF-8" /opt/homebrew/opt/postgresql@16/bin/postgres -D /opt/homebrew/var/postgresql@16

# If you need to have postgresql@16 first in your PATH run this command:
# echo 'export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"' >> /Users/gingaranga/.zshrc
# For compiling from source, you may need to set these flags:
# export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"
# For pkgconf to find postgresql@16 you may need to set:
# export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@16/lib/pkgconfig"

# REGEX DEFINITION
# ----------------------------------------------
# EX: <a[\s\n]+class="ed-type--link store-phone"[\s\n]+href="tel:[^"]*"[\s\n]*>[^<]*<\/a[\s\n]*>
# [\s\n]+ matches both whitespace and newlines.
# [^"]* matches any character except ".
# [^<]* matches any character except <.

# ----------------------------------------------
# LOAD NVM
# ----------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion