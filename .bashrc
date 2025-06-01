# Load every .sh file in this folder
MODULES_DIR="$HOME/.config/bashrc"

for file in "$MODULES_DIR"/*.sh; do
	if [ -r "$file" ] && [ -f "$file" ]; then
	      # echo "Loading bash module: $(basename "$file")"
	      source "$file"
	fi
done
