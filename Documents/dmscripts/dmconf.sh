DMEDITOR="st -e nvim"

declare -a options=(
"alacritty - $HOME/.config/alacritty/alacritty.yml"
"i3 - $HOME/.config/i3/config"
"polybar - $HOME/.config/polybar/config.ini"
"nvim - $HOME/.config/nvim/init.vim"
"quit"
)


choice=$(printf '%s\n' "${options[@]}" | dmenu -i -l 5 -p 'Edit config:')

if [[ "$choice" == "quit" ]]; then
	echo "Program terminated." && exit 1

elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$DMEDITOR "$cfg"

else
	echo "Program terminated." && exit 1
fi
