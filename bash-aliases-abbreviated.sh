# aliases
alias g=git
alias gk='gitk &'
alias gka='gitk --all &'
alias gd='git diff'
alias gdc='git diff --cached'
if [[ "$OSTYPE" == 'linux-gnu' ]]; then
	alias s=./symfony
	alias symfony=./symfony
else
	alias s=symfony
fi
