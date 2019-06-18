export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="workmad3"

COMPLETION_WAITING_DOTS="true"

plugins=(
  brew
  osx

  vi-mode
  zsh_reload
  zsh-navigation-tools
  history-substring-search

  chruby

  docker
  docker-compose

  git
  git-hubflow
  github

  rake rake-fast thor
  knife

  gem
  bundler

  httpie
  heroku
  terraform
  jira

  nvm
  npm
  yarn

  vundle

  rails)

# User configuration

source $ZSH/oh-my-zsh.sh
