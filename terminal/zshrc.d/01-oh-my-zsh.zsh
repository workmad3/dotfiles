export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="workmad3"

COMPLETION_WAITING_DOTS="true"

plugins=(
  brew
  osx

  zsh_reload

  history-substring-search

  vi-mode

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

  vundle

  rails)

# User configuration

source $ZSH/oh-my-zsh.sh
