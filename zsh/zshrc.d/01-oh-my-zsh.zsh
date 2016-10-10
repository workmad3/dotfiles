export ZSH=/Users/workmad3/.oh-my-zsh

ZSH_THEME="workmad3"

COMPLETION_WAITING_DOTS="true"

plugins=(
  brew brew-cask
  osx
  colored-man

  zsh_reload

  history-substring-search

  vi-mode

  chruby

  git
  git-hubflow
  github

  rake rake-fast thor
  knife

  gem
  bundler

  redis_cli
  httpie
  heroku
  terraform
  jira

  vundle

  rails)

# User configuration

source $ZSH/oh-my-zsh.sh
