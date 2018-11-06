export GPG_TTY=$(tty)
# gpgconf --launch gpg-agent
export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh
echo "UPDATESTARTUPTTY" | gpg-connect-agent
