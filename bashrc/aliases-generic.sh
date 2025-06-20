# generic aliases for any machine

########### config
alias edit-bash="vim ~/.config/bashrc"
alias reload-bash="source ~/.bashrc"
alias edit-nvm="vim ~/.config/nvim"
alias edit-tmux="vim ~/.tmux.conf"
#alias edit-clang-format="vim ~/.clang-format"
#alias edit-prettier="vim ~/.prettierrc"

########## generic helpers
alias untar="tar -xzf"

##########  compilation / execution
alias comp="cc -Wall -Wextra -Werror *.c"
alias test="make test"
alias leak="make leak"
alias py="python3"

######### git
alias gst="git status"
alias gcl="git clone"
alias ga="git add"
alias gaa="git add ."
alias gm="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gs="git stash"

#########  tmux
alias tl="tmux ls"
alias ta="tmux attach -t"
alias td="tmux detach"
alias tr="tmux rename"
alias tk="tmux kill-session -t"
alias tn="tmux new -t"

#########  docker
alias du="docker compose up --build"

