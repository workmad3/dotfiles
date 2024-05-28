export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="workmad3"

COMPLETION_WAITING_DOTS="true"

plugins=(
  brew
  macos

  vi-mode
  zsh-navigation-tools
  history-substring-search
  colorize

  docker
  docker-compose

  git
  git-prompt
  git-hubflow
  github

  encode64

  httpie
  heroku
  terraform

  node
  nvm
  npm
  yarn

  vundle

  1password
)

# User configuration

source $ZSH/oh-my-zsh.sh
