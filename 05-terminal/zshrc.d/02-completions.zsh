zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:functions' ignored-patterns '_*'

fpath=($HOME/.zsh-completions.d $fpath)

if type brew &> /dev/null
then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi

autoload -Uz compinit
compinit