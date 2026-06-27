# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true

# Sets the interrupt signal to the code sent by Alacritty's Ctrl+Shift+C
stty intr ^C
# Disables Ctrl+V literal-next so it doesn't conflict with paste
stty lnext undef

# The default PS1
# export PS1="\[$(ppwd)\]\u@\h:\w>"

# The new PS1
export PS1="\w\[\e[2m\]
>\[\e[4m\]"

# PS1 variant if the output is not explicitly colorized
# export PS1="\[\e[38;5;245m\]\w\[\e[0m\]
# \$ "

#  -------------
# | Setting PS1 |
#  -------------
# 1. Настройваме PS1 за промпта (Пътят е сив, командата е бяла)
PS1="\[\e[38;5;245m\]\w\[\e[0m\]
\$ "

# 2. Променяме цвета на изхода (напр. светло син/cyan)
# Тази функция се изпълнява преди всяка команда
preexec() {
    echo -ne "\e[36m" # Код за Cyan (светло синьо)
}
trap 'preexec' DEBUG

# 3. Връщаме нормалния цвят за самия промпт
# (Това гарантира, че PS1 винаги започва "на чисто")
PROMPT_COMMAND='echo -ne "\e[0m"'

#  ---------
# | Aliases |
#  ---------
alias c="clear"
alias g="git"
alias docs="cd ~/Documents/"
alias config="cd ~/.config/"
alias srcbash="source ~/.bashrc"
alias ff="fastfetch"

alias brc="nvim ~/.bashrc"
alias brel="source ~/.bashrc"
alias swrc="nvim ~/.config/sway/config"
alias p="pacman"
alias n="nvim"
alias mi="makeinfo"
alias i="info"

export SDL_VIDE0DRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
