# Workspace Dotfiles Breakdown

**Evan Marshall**

- [Profile](https://github.com/evanMarshallTheBay 'Evan Marshall')
- [Email](mailto:evan.marshall@thebay.com?subject=Hi% 'Hi!')
- [Website](https://www.thebay.com/ 'Welcome')

## Steps

### 1. Install Homebrew

First, check that you have Xcode installed:

<pre>
  xcode-select --install
</pre>

Then run:

<pre>
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
</pre>

### 2. Install NVM & Configure Node

<pre>
  brew install nvm
</pre>

Create an .nvm directory:

<pre>
  mkdir ~/.nvm
</pre>

Then add the following lines to your .zshrc:

<pre>
  export NVM_DIR=~/.nvm <br>
  source $(brew --prefix nvm)/nvm.sh
</pre>

Now quit and reopen terminal.

<pre>
  nvm install node <br>
  nvm use node
</pre>

Check that node and nvm are installed correctly:

<pre>
  nvm -v && node -v
</pre>

### 3. Install Yarn

<pre>
  npm install -g yarn
</pre>

Check that yarn is installed correctly:

<pre>
  yarn -v
</pre>

### 4. Install Gulp

<pre>
  brew install gulp-cli
</pre>

### 5. Install Git & Create SSH Keys

<pre>
  brew install git <br>
  ssh-keygen -t ed25519 -C "your_email@example.com"
</pre>

Accept the default file path and passphrase.
Start SSH agent in background:

<pre>
  eval "$(ssh-agent -s)"
</pre>

Check if a config file is created and if not, create one:

<pre>
  open ~/.ssh/config
</pre>

AND/OR:

<pre>
  touch ~/.ssh/config
</pre>

Add the following to config:

<pre>
  Host * <br>
  &nbsp;&nbsp;AddKeysToAgent yes <br>
  &nbsp;&nbsp;UseKeychain yes <br>
  &nbsp;&nbsp;IdentityFile ~/.ssh/id_ed25519
</pre>

Add SSH private key to SSH agent and store passphrase in keychain:

<pre>
  ssh-add -K ~/.ssh/id_ed25519
</pre>

Add public key to GitHub account:

<pre>
  pbcopy < ~/.ssh/id_ed25519.pub
</pre>

Then go to GitHub profile>settings>SSH and GPG keys.
Add new SSH Key>Title i.e. "Work MacBook Pro" and paste key into "key" field.
