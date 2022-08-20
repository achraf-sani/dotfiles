#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa -l --color=always --group-directories-first'
alias lsh='exa -la --color=always --group-directories-first'
PS1='[\u@\h \W]\$ '
alias cp="cp -iv"
alias minecraft="java -jar ~/Téléchargements/TL-MCL.jar"
alias inwi="nmcli dev wifi connect 'inwi Home 4G BC8BD5'"
alias poco="nmcli dev wifi connect 'POCO X3 Pro'"
alias ncdu="ncdu --color dark"
# screencasting with audio
alias recordscreen="ffmpeg -y -f x11grab -i :0.0 -f alsa -i default"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

#POWERLINE
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /usr/share/powerline/bindings/bash/powerline.sh

declare -A TRUELINE_COLORS=(
    [light_blue]='75;161;207'
    [grey]='99;99;100'
    [pink]='199;88;157'
)

declare -a TRUELINE_SEGMENTS=(
    'working_dir,light_blue,black,normal'
    'git,grey,black,normal'
    'time,white,black,normal'
    'newline,pink,black,bold'
)

declare -A TRUELINE_SYMBOLS=(
    [git_modified]='*'
    [git_github]=''
    [segment_separator]=''
    [working_dir_folder]='...'
    [working_dir_separator]='/'
    [working_dir_home]='~'
    [newline]='❯'
    [clock]='🕒'
)

TRUELINE_GIT_SHOW_STATUS_NUMBERS=false
TRUELINE_GIT_MODIFIED_COLOR='grey'
TRUELINE_WORKING_DIR_SPACE_BETWEEN_PATH_SEPARATOR=false

_trueline_time_segment() {
    local prompt_time="${TRUELINE_SYMBOLS[clock]} \t"
    if [[ -n "$prompt_time" ]]; then
        local fg_color="$1"
        local bg_color="$2"
        local font_style="$3"
        local segment="$(_trueline_separator)"
        segment+="$(_trueline_content "$fg_color" "$bg_color" "$font_style" " $prompt_time ")"
        PS1+="$segment"
        _trueline_record_colors "$fg_color" "$bg_color" "$font_style"
    fi
}

# source ~/trueline/trueline.sh
# printf "\n"
#exec fish
neofetch
. "$HOME/.cargo/env"

### RANDOM COLOR SCRIPT ###
colorscript -e jangofett

alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto"
alias config='/usr/bin/git --git-dir=/home/achraf/voidrice --work-tree=/home/achraf'
