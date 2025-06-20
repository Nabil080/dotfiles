#### functions

## clone from git config --get user.name
clone () {
	username=$(git config --get user.name)
	## TODO: error if no username
	git clone git@github.com:Nabil080/${1}.git
}

## clone from custom username
cloneFrom () {
	git clone git@github.com:${2}/${1}.git
}

## run a cmd on all subdirectories
runCommand() {
    for d in ./*/ ; do /bin/zsh -c "(cd "$d" && "$@")"; done
}

## curl request helper
# $1 -> request type (GET POST..)
# $2 -> pathname (users/register..)
# $3 -> body (optional)
request() {
  /usr/bin/curl -k -X "$1" "https://localhost:8080/$2" \
    -H "Content-Type: application/json" \
    -d "${3:-{}}"
}
