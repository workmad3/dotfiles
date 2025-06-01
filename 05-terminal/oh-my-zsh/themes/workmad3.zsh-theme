# My theme - ash.moran@patchspace.co.uk

# Based on Fino theme with bits from dallas and robbyrussell

# Fino notes:
# Use with a dark background and 256-color terminal!
# Meant for people with RVM and git. Tested only on OS X 10.7.
# You can set your computer name in the ~/.box-name file if you want.
# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function prompt_char {
  echo "%{$fg[yellow]%}⚡%{$reset_color%}"
}

function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function box_name_prompt {
  echo "%{$fg[blue]%}💻 $(box_name)%{$reset_color%}"
}

function last_status {
  echo "%(?,%{$fg[green]%}😸 ,%{$fg[red]%}😾 )$RETVAL%{$reset_color%}"
}

function folder_prompt {
  echo "%{$fg[yellow]%}📂 %~%{$reset_color%}"
}

function user_prompt {
  echo "%{$fg[green]%}👤 %n%{$reset_color%}"
}

function docker_prompt {
  echo "%{$FG[039]%}🐋 $(current-docker-machine)%{$reset_color%}"
}

build_prompt() {
  RETVAL=$?

  echo -n "╭─ "
  echo -n "$(user_prompt) "
  #suppress the newlines here
  echo -n "$(box_name_prompt) "
  echo -n "$(folder_prompt) "
  echo -n "$(git_super_status) "
  echo -n "$(docker_prompt) "
  #want the newline here
  echo "$(vi_mode_prompt_info)"

  #Don't care about the newline here, last line
  echo "╰─ $(last_status) $(prompt_char) "
}

# Replace fino git with a combination of fino+robbyrussell git:
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}🔴 %{$reset_color%}"

MODE_INDICATOR="%{$fg_bold[white]%}VIM%{$reset_color%}"

PROMPT='$(build_prompt)'
RPROMPT=''
