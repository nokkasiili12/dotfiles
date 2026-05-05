#
# ~/.bashrc
#

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

SHOW_GIT=true

C0="\[\e[30m\]"
C1="\[\e[31m\]"
C2="\[\e[32m\]"
C3="\[\e[33m\]"
C4="\[\e[34m\]"
C5="\[\e[35m\]"
C6="\[\e[36m\]"
C7="\[\e[37m\]"
C8="\[\e[90m\]"
C9="\[\e[91m\]"
C10="\[\e[92m\]"
C11="\[\e[93m\]"
C12="\[\e[94m\]"
C13="\[\e[95m\]"
C14="\[\e[96m\]"
C15="\[\e[97m\]"

RESET="\[\e[0m\]"
BOLD="\[\e[1m\]"

COL_USER_HOST="${C4}"
COL_CURRENT_PATH="${C6}"
COL_GIT_STATUS_CLEAN="${C2}"
COL_GIT_STATUS_CHANGES="${C1}"
COL_CURSOR="${C5}"

set_bash_prompt() {
    PS1="${RESET}"
    PS1+="${BOLD}${COL_USER_HOST}\u@\h ${RESET}${COL_CURRENT_PATH}\w "

    PS1+="\n${COL_CURSOR}└─▶ "
    PS1+="${RESET}"
}

PROMPT_COMMAND=set_bash_prompt
