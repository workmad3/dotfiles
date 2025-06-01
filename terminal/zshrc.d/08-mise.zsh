if [ -f "/Users/workmad3/.local/bin/mise" ]; then
	eval "$(/Users/workmad3/.local/bin/mise activate zsh)"
else
	eval "$(mise activate zsh)"
fi
