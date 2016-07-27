zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:functions' ignored-patterns '_*'

fpath=($HOME/.zsh-completions.d /usr/local/share/zsh-completions $fpath)
autoload -U $HOME/.zsh-completions.d/*(:t)
autoload -U /usr/local/share/zsh-completions/*(:t)
compinit