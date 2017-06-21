#!/usr/bin/env bash
# these will run as the default non-privileged user. 

# ensure we have the latest packages, including git and sublime text repos
sudo add-apt-repository ppa:git-core/ppa
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt -y full-upgrade

# make sure we have the required libraries and tools already installed before starting.
sudo apt install -y build-essential libssl-dev libreadline-dev zlib1g-dev sqlite3 libsqlite3-dev libgtk2.0-0 libbz2-dev sublime-text

# set the DISPLAY variable to point to the XServer running on our Windows PC
echo "export DISPLAY=:0" >> ~/.bashrc

# start with rbenv and plugins installation 
export PATH="$HOME/.rbenv/bin:$PATH" 
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
# install dynamic bash extension
cd ~/.rbenv && src/configure && make -C src
# add the rbenv setup to our profile, only if it is not already there
if ! grep -qc 'rbenv init' ~/.bashrc ; then
  echo "## Adding rbenv to .bashrc ##"
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc 
fi
# run the above command locally so we can get rbenv to work on this provisioning shell
eval "$(rbenv init -)"
# install a set of useful plugins for rbenv...
mkdir -p /home/seapagan/.rbenv/plugins
git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs
git clone https://github.com/sstephenson/rbenv-default-gems.git ~/.rbenv/plugins/rbenv-default-gems
git clone https://github.com/rbenv/rbenv-each.git ~/.rbenv/plugins/rbenv-each
git clone https://github.com/nabeo/rbenv-gem-migrate.git ~/.rbenv/plugins/rbenv-gem-migrate
git clone git://github.com/jf/rbenv-gemset.git ~/.rbenv/plugins/rbenv-gemset
git clone https://github.com/nicknovitski/rbenv-gem-update ~/.rbenv/plugins/rbenv-gem-update
git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update
git clone https://github.com/toy/rbenv-update-rubies.git ~/.rbenv/plugins/rbenv-update-rubies
git clone https://github.com/rkh/rbenv-whatis.git ~/.rbenv/plugins/rbenv-whatis
# set up a default-gems file for gems to install with each ruby...
echo $'bundler\nsass\nscss_lint\nrails' > ~/.rbenv/default-gems
# set up .gemrc to avoid installing documentation for each gem...
echo "gem: --no-document" > ~/.gemrc
# install the required ruby version and set as default
rbenv install 2.4.1
rbenv global 2.4.1
gem update --system
gem update

# now install nvm, the latest LTS version of Node and the latest actual verision of Node..
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts
nvm install node

# next install python (both 2.x and 3.x trees) using Pyenv
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
if ! grep -qc 'pyenv init' ~/.bashrc ; then
  echo "## Adding pyenv to .bashrc ##"
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(pyenv init -)"' >> ~/.bashrc
fi
# run the above locally to use in this shell
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

pyenv install 2.7.13
pyenv install 3.6.1
# 'python' and 'python2.7' target 2.7.13 while 'python3.6' targets 3.6.1
pyenv global 2.7.13 3.6.1

# now to install Perl using Perlbrew...



echo
echo "You now need to close and restart the Bash shell"
