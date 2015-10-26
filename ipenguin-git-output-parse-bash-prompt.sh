#The following lines should be added to your .bashrc file to use the git-output.awk file

# ⚫ ❨ ❩ ▲ ⬇ ⑈ ⑉ ǁ» ║ ⑆ ⑇ ⟅ ⟆ ⬅ ➤ ➥ ➦ ➡
SEPARATOR="‡"
SEPARATOR2="|"


function parse_git_output {

    output=$(git status 2> /dev/null | ~/Bash-Scripts/git-output.awk -v separator=$SEPARATOR separator2=$SEPARATOR2 2> /dev/null) || return
    echo -e "$output";
}

BLACK="\[\e[00;30m\]"
DARY_GRAY="\[\e[01;30m\]"
RED="\[\e[00;31m\]"
BRIGHT_RED="\[\e[01;31m\]"
GREEN="\[\e[00;32m\]"
BRIGHT_GREEN="\[\e[01;32m\]"
BROWN="\[\e[00;33m\]"
YELLOW="\[\e[01;33m\]"
BLUE="\[\e[00;34m\]"
BRIGHT_BLUE="\[\e[01;34m\]"
PURPLE="\[\e[00;35m\]"
LIGHT_PURPLE="\[\e[01;35m\]"
CYAN="\[\e[00;36m\]"
BRIGHT_CYAN="\[\e[01;36m\]"
LIGHT_GRAY="\[\e[00;37m\]"
WHITE="\[\e[01;37m\]"
ENDCOLOR="\e[m"

if [ "$SSH_CONNECTION" == "" ]; then
    PS1="${BRIGHT_RED}#--[ ${GREEN}\h ${DARY_GRAY}${SEPARATOR} ${BRIGHT_BLUE}\w \$(parse_git_output)${BRIGHT_RED}]\\$ -->${ENDCOLOR}\n"
else
    PS1="${BRIGHT_RED}#--[ ${YELLOW}\h ${DARY_GRAY}${SEPARATOR} ${BRIGHT_BLUE}\w \$(parse_git_output)${BRIGHT_RED}]\\$ -->${ENDCOLOR}\n"
fi
