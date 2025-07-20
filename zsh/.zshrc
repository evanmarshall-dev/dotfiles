# Added for homebrew on windows WSL Ubuntu
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ADD OH-MY-POSH AS PROMPT.
# ----------------------------------------------
# DEFAULT.
# eval "$(oh-my-posh init zsh)"

# Fix for ANSI characters
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   eval "$(oh-my-posh init zsh)"
# fi

# TO USE A THEME IN HOMEBREW DIRECTORY.
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/cloud-native-azure.omp.json)"
fi

# TO USE CUSTOM THEME IN YOUR CUSTOM THEME DIRECTORY. AFTER EXPORT (SEE BELOW ALIAS).
# eval "$(oh-my-posh init zsh --config ~/.config/posh/.custom-atomic.omp.toml)"

# TO USE A REMOTE THEME.
# eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/cloud-native-azure.omp.json')"

# Faves = chips.omp.json, cloud-native-azure.omp.json, froczh.omp.json, iterm2.omp.json, jandedobbeleer.omp.json, jblab_2021.omp.json, kushal.omp.json, mojada.omp.json, montys.omp.json, quick-term.omp.json, sonicboom_light.omp.json, wholespace.omp.json

# NEEDED FOR ZSH-COMPLETIONS (Before omz sourcing)
# ----------------------------------------------
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
source "$ZSH/oh-my-zsh.sh"

# PATH TO OH MY ZSH INSTALLATION.
# ----------------------------------------------
export ZSH="$HOME/.oh-my-zsh"

# ZSH PLUGINS.
# ----------------------------------------------
plugins=(
  zsh-completions
  git
  node
  brew
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# SOURCE.
# ----------------------------------------------
source $ZSH/oh-my-zsh.sh

# MACOSX ALIASES.
# ----------------------------------------------
hiddenOn() {
  echo "Show hidden folder on your Mac. 👓👓"
  defaults write com.apple.Finder AppleShowAllFiles true
  echo "***************************************************"
  echo "Refresh finder window. 🪟"
  echo "***************************************************"
  killall Finder ;
  echo "DONE! 😃"
} # Show hidden folders in MacOSX.

hiddenOff() {
  echo "Hide hidden folder on your Mac. 👓"
  defaults write com.apple.Finder AppleShowAllFiles true
  echo "***************************************************"
  echo "Refresh finder window. 🪟"
  echo "***************************************************"
  killall Finder ;
  echo "DONE! 😃"
} # Hide hidden folders in MacOSX.

# VSCODE & CLI ALIASES.
# ----------------------------------------------
alias co="echo -e 'Open up vscode in current working directory!! 👐\n\n' && code ." # Opens up vscode in current working directory.
alias cc="echo -e 'Open up vscode in specific directory!! 👐\n\n' && code $1" # Append directory or path to open up vscode in said directory.
alias codedir="code ${HOME}/Library/'Application Support'/Code/User" # Opens up vscode directory containing settings.json, keybindings and snippets.
alias up="echo -e 'Going up a directory, boiiii! 🛸\n\n' && cd .." # Up one directory.
alias in="echo -e 'Getting all up in that directory! 🚪\n\n' && cd" # Out to root directory or if you follow this command with a directory name or path it moves into said directory. Use ZSH autosuggest to append directory name to end of this alias.
alias md="echo -e 'You make that folder! 📁\n\n' && mkdir $1" # Create a directory. Append directory name to this alias.
alias dd="echo -e 'Nobody wants that folder! 🤮\n\n' && rm -r" # Remove a directory recursively (Removes all sub-directories and files). Use ZSH autosuggest to append directory name to end of this alias.
alias mf="echo 'Populating your computer with little baby files! 👶\n\n' && touch $1" # Create a file. Append the name of the file (including file type) to the end of this alias.
alias df="echo -e 'The milk was a bad choice, remove that file! 🥛\n\n' && rm" # Remove a file. Use ZSH autosuggest to append file name to the end of this alias.
alias m="echo -e 'Just keep moving, just keep moving! 🐠\n\n' && mv $1 $2" # Move a file. Append the file name and destination path to the end of this alias.
alias c="echo -e 'Copying that file?? How about you be original! ©️\n\n' && cp $1 $2" # Copy a file. Append the file name and destination path to the end of this alias.
alias l="echo -e 'Ooooo, what is in here?! 🧐\n\n' && ls" # List contents of current directory.
alias la="echo -e 'Ooooo, piece a candy! 🍬\n\n' && ls -a" # Lists all contents including hidden files and admin permissions.
alias p="echo -e 'Where are we again? 😳\n\n' && pwd" # Displays your current directory.
alias cl="echo -e 'Time to clean up, it is messy in here!! 🧹\n\n' && clear" # Clears terminal/command window.
alias oiw="code -r" # Open project in same vscode window. Make sure you navigate to said dir and append with a period.

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

# HOMEBREW ALIASES.
# ----------------------------------------------
alias bl="echo -e 'Let us see what brews you have in your collection. 📚\n\n' && brew list" # Lists all Homebrew packages.
alias bi="echo -e 'Let us install a brew package. \n\n' && brew install $1" # Installs a Homebrew package. Just append the package name after the alias.
alias bic="echo -e 'Let us install a brew cask. \n\n' && brew install $1 --cask" # Installs a Homebrew cask. Just append the cask name after the alias.

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

# WSL/UBUNTU ALIASES.
# ----------------------------------------------
alias -g uup="echo -e 'Your linux packages are looking a bit dated... 👴\n\n' && sudo apt-get update && sudo apt-get upgrade -y" # Updates/upgrade linux packages and prompt "yes" anytime command asks for it.

# LINUX ALIASES.
# ----------------------------------------------
alias lups="sudo yay -Syu" # Update system.
alias lup="sudo yay -Sy" # Update packages.
alias lin="sudo yay -S $1" # Install package. Append with package name.
alias lroot="sudo chown root: $1" # Give root ownership to file or folder. Append name of file or folder.
alias l600="sudo chmod 600 $1" # Give 600 permissions (read/write) to file or folder. Append name of file or folder.
alias l775="sudo chmod 775 $1" # Give 775 (all: read/write/execute) permissions to file or folder. Append name of file or folder.
alias lid="id $1" # Get UID and PID for user. Append with username.
alias lg=" | grep $1" # See if this works. Basically I want to filter out results based on keyword ($1). This should be added to end of command.
alias lss="yay -Ss $1" # Search package by name. Append with package name.
alias lsdrive="sudo blkid" # List storage devices with ID.

# FACL ALIASES.
# ----------------------------------------------
alias f775="sudo setfacl -Rdm u:$1:rwx $2" # Give user ($1) all permissions to file or folder using ACL package. Append name of file or folder.
alias f775e="sudo setfacl -Rm u:$1:rwx $2" # Give user ($1) all permissions to file or folder using ACL package for all existing. Append name of file or folder.
alias f775g="sudo setfacl -Rdm g:docker:rwx /home/gingaranga/docker" # Same as above except for docker global.
alias f775ge="sudo setfacl -Rm g:docker:rwx /home/gingaranga/docker" # Same as above except for docker global for existing.
alias flist="getfacl $1" # Get ownership/permission for file or folder. Append with name of file or folder.

# DOCKER/PORTAINER/DOCKER-COMPOSE ALIASES.
# ----------------------------------------------
alias dci="yay -S docker docker-compose" # install docker and docker compose.
alias dst="sudo systemctl start docker.service" # Start docker service.
alias den="sudo systemctl enable docker.service" # Enable docker service.
alias dstp="sudo systemctl stop docker.service" # Stop docker service.
alias duser='sudo groupadd docker && sudo usermod -aG docker $USER && newgrp docker' # Add current user to docker so you do not need to be super user.
alias dusera="ps aux | grep docker" # Check user access to docker.
alias dstat="systemctl status docker" # Check status of docker.
alias pmkdir="sudo docker volume create portainer_data" # Create volume for docker inside docker.
alias prun="sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart-always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest" # Install portainer image, set to port 9443, name portainer, and run latest instance or portainer community edition.
alias dcon="sudo docker ps -a" # Check currently running docker containers.
alias drst="sudo docker restart $1" # Restart docker container. Append with container name.
alias dstco="sudo docker compose -f /home/gingaranga/docker/docker-compose-$1.yml up -d" # Run docker using docker-compose. Append with name of host.
alias dendco="sudo docker compose -f /home/gingaranga/docker/docker-compose-$1.yml down" # End docker using docker-compose. Append with name of host.
alias dlog="sudo docker compose -f /home/gingaranga/docker/docker-compose-$1.yml logs -tf --tail='50' $2" # Show currently running logs for docker container. Append with host name ($1) and container name ($2).
alias dclean="sudo docker system prune && sudo docker image prune && sudo docker volume prune" # Clean up unused system files, images and volumes.

# OLLAMA ALIASES.
# ----------------------------------------------
# When installing via homebrew it installs locally and runs at localhost:11434. Therefore it does not use API keys.
alias oni="pnpm install ollama" # Install ollama via pnpm.
alias osr="ollama serve" # General start to ollama.
alias ocr="ollama create" # Create a model from a Modelfile.
alias osh="ollama show" # Show info for a model.
alias opu="ollama pull" # Pull a model from a registry.
alias ops="ollama push" # Push a model to a registry.
alias ocp="ollama cp" # Copy a model.
alias orm="ollama rm" # Remove a model.
alias ohp="ollama help" # Ollama help.
alias ovr="ollama --version" # Check currently installed ollama version.
alias oli="ollama list" # Check available and installed models.

orun() {
  local model=${1}
  local version=${2}
  if [ -z "$model" ]; then
    echo "Please provide a model name."
    return 1
  fi
  if [ -z "$version" ]; then
    ollama run $model
  else
    ollama run $model:$version
  fi
} # Run the an ollama model. Specify model and version. If no version provided it defaults to blank. Reference: https://ollama.com/library

# VERCEL CLI ALIASES.
# ----------------------------------------------
# Check reference here: https://vercel.com/docs/cli
alias vci="pnpm i -g vercel" # Install vercel cli globally using pnpm.
alias vcu="pnpm i -g vercel@latest" # Update vercel cli.
alias vcv="vercel --version" # Check vercel cli version.
alias vcc="vercel project ls --update-required" # Check if any local vercel projects require updates.

# PAYLOAD ALIASES.
# ----------------------------------------------
alias payi="pnpx create-payload-app@latest"

# ZSH/OH-MY-ZSH ALIASES.
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

# SSH ALIASES.
# ----------------------------------------------
alias shao="echo -e 'Making sure you are in the correct directory before creating some SSH stuff! 🔍\n\n' && cd ${HOME}/.ssh" # Navigate to global ssh directory.
alias shacon="echo -e 'Open that config... SHHHHH! 🤫\n\n' && code ${HOME}/.ssh/config" # Edit global ssh configuration using vscode.
alias shagen="echo -e 'The key to your heart :) 💞\n\n' && ssh-keygen -t ed25519 -C $1" # Creates a local SSH key if followed by filename (i.e. personal-github).
alias shagent="echo -e 'I do not know what this is, but we gotta do it or else the next step will not work... 😕\n\n' && eval '$(ssh-agent -s)'" # Starts SSH agent.
alias shakey="echo -e 'The name is Bond, James Bond... and I need that key! 🔑\n\n' && ssh-add --apple-use-keychain ${HOME}/.ssh" # TODO: Figure out how to add this alias with variable because the forward slash throws it off.
# Adds SSH key to agent. Make sure you add filename created with skgen alias to the end of this alias. ** For Windows/WSL you need to remove "UseKeychain from SSH config and -K/--apple-use-keychain from this code."
alias shatest="echo -e 'Did it work?? ✋\n\n' && ssh -T git@$1" # Test your connection. Make sure you add your Host name created during the config file setup, to the end of this alias.

# GULP ALIASES.
# ----------------------------------------------
alias gu="echo -e 'GULP! 😧\n\n' && gulp" # Runs gulp command.
alias gufr="echo -e 'LES GULP!? 👨‍🎨\n\n' && gulp devFr" # Runs French gulp command.
alias gut="echo -e 'Let us check out that work! 🤑\n\n' && gulp --template $1" # Runs development task on HTML template if followed by template name. If none provided, default.html template will be used.
alias gutfr="echo -e 'Tu es... Grande poulette! 👨‍🎨\n\n' && gulp devFr --template $1" # Runs French development task on HTML template if followed by template name. If none provided, default.html template will be used.
alias gub="echo -e 'Well you are just a cute little Bob the builder! 👷‍♂️\n\n' && gulp build" # Runs build tasks.
alias gubfr="echo -e 'Es que je puis aller aux toilettes! 👨‍🎨\n\n' && gulp buildFr" # Runs the French build tasks.
alias gucl="echo -e 'Clean up, clean up, everybody clean up! 🎵\n\n' && gulp clean" # Runs the clean or delete task for dev and prod directories.

# GIT ALIASES.
# ----------------------------------------------
alias gcon="echo -e 'Opening your global Git Config file. 🎛️\n\n' && code ${HOME}/.gitconfig" # Opens global gitconfig file in vscode.
alias gup="git config --global $1" # Update Git Config parameter.
alias gig="echo -e 'Opening up your global Git Ignore file. 🎛️\n\n' && code ${HOME}/.gitignore_global" # Opens global gitconfig file in vscode.
alias gl="git log --graph --oneline --decorate" # Provides a graph of the git log.
alias gs="echo -e 'All right! What is going on here? 😕\n\n' && git status" # Provides git status.
alias gcb="echo -e 'A new branch is sprouting on your Git tree 🌳\n\n' && git checkout -b $1" # Switch to and create branch. Append branch name to the end of this alias.
alias gsb="echo -e 'Let us climb to that branch! 🌴\n\n' && git checkout $1" # Switched to branch specified after this alias.
alias gc="echo -e 'Let us The Sixth Day this shhhh! 🕕\n\n' && git clone $1" # Clones a remote repo. Append repo URL or SSH to this alias.
alias gpu="echo -e 'What are they doing up there? Pull it down! 😶‍🌫️\n\n' && git pull" # Pulls changes from remote branch to local.
alias gp="echo -e 'Alright, we done. Push it up! 🫷⬆️\n\n' && git push" # Pushes local changes to origin.

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

gitNew() {
  echo "You just created a local project and a blank remote repo. Let us connect the two! 👊👊"
  echo "***************************************************"
  echo "First, let us create a template README for the repo. 📖📖"
  echo "***************************************************"
  echo "# New Repo" >> README.md
  echo "***************************************************"
  echo "Now, let us initiate a git directory in your local project. 📂📂"
  echo "***************************************************"
  git init
  echo "***************************************************"
  echo "Adding README.md to staging. 👩‍🎤👩‍🎤"
  echo "***************************************************"
  git add README.md
  echo "***************************************************"
  echo "Create a commit message for the first commit to remote repo. 🗒️🗒️"
  echo "***************************************************"
  git commit -m "Created new local project"
  echo "***************************************************"
  echo "Set the default branch of the project to main. 🌳🌳"
  echo "***************************************************"
  git branch -M main
  echo "***************************************************"
  echo "Now, checking to see if you added appended the remote repo name to this command. ❓❓"
  echo "***************************************************"
  if [ ! -n "$1" ]; then
    echo "*************************************************"
    echo "Enter the remote repo name, silly! 😠😠"
    echo "*************************************************"
  else
    echo "*************************************************"
    echo "Great, you added the remote repo name, now we will add remote repo as the origin. 😀😀"
    echo "*************************************************"
    git remote add origin git@dgit:evanmarshall-dev/"$1".git
    echo "*************************************************"
    echo "Push committed local file to the remote repo. ⬆️⬆️"
    echo "*************************************************"
    git push -u origin main
  fi
} # Connect a local project to an empty remote git repo, add template README file, stage README, commit README, and then push README to the remote repo or origin.

# GITHUB CLI ALIASES.
# ----------------------------------------------
alias ghlogin="gh auth login" # Login and authenticate your GitHub account locally.
alias ghlist="gh extension list" # List all GitHub CLI extensions.
alias ghci="gh extension install github/gh-copilot" # Install GitHub CLI extension: GitHub Copilot.
alias ghcs="gh copilot suggest '$1'" # Suggests a command. Make sure you append what you want a suggestion for to this alias.
alias ghce="gh copilot explain '$1'" # Explains a command. Make sure you append what you want an explanation for to this alias.

# REACT/VITE/VITEST ALIASES.
# ----------------------------------------------
alias rca="npx create-react-app" # Creates React app using create-react-app tool.

cva() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Both an app name and a template are required."
    echo "Usage: rcvc <app-name> <template-name>"
    echo "Example: rcvc my-react-app react"
    return 1
  fi
  pnpm create vite "$1" --template "$2"
} # Create a Vite app, requiring both an app name and a template (e.g., react, vue, svelte).


alias rcv="pnpm create vite" # Creates React app using Vite tool.
alias rrd="pnpm run dev" # Starts dev server to preview project.
alias vti="pnpm install -D vitest @vitest/ui eslint-plugin-vitest" # Installs dependencies for vitest.
alias rtli="pnpm install -D jsdom @testing-library/jest-dom @testing-library/react" # Installs dependencies for react testing library.

alias jsw="npx json-server --watch data/db.json --port 8000"

# NEXTJS ALIASES.
# ----------------------------------------------
nxi() {
  local package_manager=$1
  local version=${2:-latest}
  npx create-next-app@$version --use-$package_manager
} # Launch create next app dialog. Append arguments for package manager and next.js version (If no version provided then it defaults to latest).

# SVELTE ALIASES.
# ----------------------------------------------
alias svi="npx sv create $1" # Launch interactive sveltekit install. Append with the name of your app.
alias svd="pnpm dev --open" # Launch dev server with local Sveltekit app.

# PNPM ALIASES.
# ----------------------------------------------
alias pw="where pnpm" # Shows where pnpm is installed on your system. When doing a fresh install, remove all instances of it with rm -rf /path-to-install.
alias p="pnpm" # Alias for pnpm.
alias pi="pnpm install" # Installs all dependencies in the package.json.
alias pig="curl -fsSL https://get.pnpm.io/install.sh | sh -" # Installs pnpm package manager globally using curl.
alias pa="pnpm add '$1'" # Append this command with the package name to install it.
alias pad="pnpm add -D '$1'" # Append this command with the package name to install it as a dev dependancy.
alias pr="pnpm rm '$1'" # Append this command with the package name you would like to remove.
alias prg="pnpm rm -g '$1'" # Append this command with the global package name you would like to remove.
alias pad="pnpm add g '$1'" # Append this command with the package name to install it globally.
alias pru="pnpm run '$1'" # Append this command with the script you want to run (i.e. pr dev or pr lint).
alias pu="pnpm self update" # Updates your instance of pnpm package manager.
alias pup="pnpm up" # To update packages to latest specified versions in package.json.
alias pulp="pnpm up --latest" # Same as above, but ignoring package.json.
alias pd="pnpm dlx '$1'" # Append this command with the package you would like to install via binaries, alternative to npx.

# YARN ALIASES.
# ----------------------------------------------
alias y="yarn install" # Install yarn packages.
alias yi="yarn init -y" # Initialize yarn with yarn.lock file in current project.
alias ya="yarn add $1" # Add an yarn package and apply as a project dependancy. Append the package name to the end of the alias.
alias yr="yarn remove $1" # Remove an yarn package. Append the package name to the end of the alias.
alias yad="yarn add -D $1" # Add an yarn package and apply as a dev dependancy. Append package name to the end of the alias.
alias yga="yarn global add $1" # Add an yarn package and have it installed globally. Append the package name to the end of the alias.
alias ygr="yarn global remove $1" # Remove a globally installed yarn package. Append the package name to the end of the alias.
alias yu="yarn upgrade-interactive --latest" # Upgrade all yarn packages to their latest version.
alias ygu="yarn global upgrade" # Upgrade global yarn packages.
alias yl="yarn list --depth=0" # List local yarn packages.
alias ygl="yarn global list --depth=0" # List global yarn packages.
alias yo="yarn outdated" # List outdated yarn packages.

# NPM ALIASES.
# ----------------------------------------------
alias ni="npm init" # Initialize npm in current project with a package.lock file.
alias nu="npm-check -u" # Update npm packages using interactive guide.
alias no="npm outdated" # List all outdated npm packages.
alias np="npm prune" # Removes extraneous npm packages.
alias na="npm audit" # Run a security audit for installed npm packages.
alias naf="npm audit fix" # Tries to fix any security vulnerabilities.
alias nig="npm install -g $1" # Install an npm package globally. Append package name to the end of the alias.
alias nin="npm install $1" # Install npm package as a project dependancy (Anything that is needed in production). Append package name to the end of the alias.
alias nid="npm install --save-dev $1" # Install an npm package as a dev dependancy (Only needed in development). Append package name to the end of the alias.
alias nie="npm install --save-dev --save-exact $1" # Install an npm package as a dev dependancy and pin it at the current version. Append the package name to the end of the alias.
alias nun="npm uninstall $1" # Uninstall npm packages. Append the package name to the end of the alias.
alias ncc="npm cache clean" # Deletes all of the data in the cache folder.
alias nconf="npm init @eslint/config" # Initializes eslint in the project and runs the setup/config process.
alias nlg="npm ls -g" # Lists the global installed npm packages.

# OH-MY-POSH ALIASES.
# ----------------------------------------------
ompt() {
  oh-my-posh config export --output ~/.config/posh/.custom-$1.omp.toml
} # Exports current theme to be customized. Append alias with custom theme export name. Follow up with updating the oh my posh eval at top of file.

alias ompd="oh-my-posh debug"

# RUN PERFECT DARK PORT.
# ----------------------------------------------
alias pd="cd ~/GAMING/PORTS/pd-arm64-osx && ./pd.arm64"

# WSL/UBUNTU ALIASES.
# ----------------------------------------------
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

# HUSKY ALIASES.
# ----------------------------------------------
huskySet() {
  echo "Let us setup and configure Husky! 🐕🐕"
  echo "***************************************************"
  echo "Install Husky as a dev dependancy. 🧒🧒"
  echo "***************************************************"
  npm install --save-dev husky
  echo "***************************************************"
  echo "Initialize Husky. 🛫🛫"
  echo "***************************************************"
  npx husky init
  echo "***************************************************"
  echo "Create pre-commit file. 😁😁"
  echo "***************************************************"
  npm run prepare
} # Installs Husky, initializes it and then creates a pre-commit file.

# FFMPEG ALIASES.
# ----------------------------------------------
alias ffc="ffmpeg -i $1 $2" # Replace $1 and $2 with input file and output file, respectively to convert $1 into $2.
alias ffs="ffmpeg -i $1.srt big.ass"
alias ffsub="ffmpeg -i $1 -vf ass=big.ass $2" # Takes the above created ass file and adds it as a subtitle to video file $1. The output is the $2 argument.

# REGEX VSCODE SEARCH EXAMPLES AND EXPLANATIONS
# ----------------------------------------------
# EX: <a[\s\n]+class="ed-type--link store-phone"[\s\n]+href="tel:[^"]*"[\s\n]*>[^<]*<\/a[\s\n]*>
# [\s\n]+ matches both whitespace and newlines.
# [^"]* matches any character except ".
# [^<]* matches any character except <.

# NEEDED AFTER NVM INSTALLED.
# ----------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
