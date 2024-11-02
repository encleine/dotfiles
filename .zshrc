
[ -z "$TMUX" ] &&  exec tmux new -As .

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/home/enc/.local/bin
export PATH=$PATH:/home/enc/go/bin
export PATH=$PATH:/home/enc/.cargo/bin
export PATH=$PATH:/home/enc/nand2tetris/n2t-software-suite
export NVM_DIR="$HOME/.nvm"

ZSH_THEME="robbyrussell"

plugins=(
  nats
  golang
  docker 
  git
)

source $ZSH/oh-my-zsh.sh

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias air="air && clear"
alias cl="clear"
alias pull="git pull"
alias vi="nvim"
alias reTmux="tmux source-file ~/.tmux.conf"
alias buildProf="go test -run=XXX -cpuprofile cpu.prof -bench ."
alias runProf="go tool pprof -http=localhost:8080 cpu.prof"
alias rename="git commit --amend"
alias undo="git reset HEAD~"


function discard () {
  if [[ "$1" == "" ]]; then git restore . ;
  else git restore "$1";
  fi 
} 


function checkout () {
  git checkout "$1";
  git pull > /dev/null 2>&1;

  if [[ "$2" != "" ]]; then
    nvim "$2";
  fi
}

eval "$(zoxide init zsh --cmd cd)"
