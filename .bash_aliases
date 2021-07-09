alias home="cd /cygdrive/c/Users/navpo"
alias repos="cd /cygdrive/c/Users/navpo/Documents/Repos/"
alias tcpdump="/cygdrive/c/Windows/WinDump.exe"
alias myip='echo $(dig +short myip.opendns.com @resolver1.opendns.com)'
alias g-oldremote='git config --get remote.origin.url'
alias g-newremote='git remote set-url origin'
alias pick2='shuf -e -n2 giacomo pratik rupert tyler'
function git() {
  if [[ "$1" == "setup" ]]; then
    shift 1
    command git remote add fork "$@"
    command git fetch fork
    command git push fork
  elif [[ "$1" == "sync" ]]; then
    shift 1
    command git fetch --prune --multiple origin fork && git push fork origin/master:master
  elif [[ "$1" == "new" ]]; then
    command git checkout -b "$@" origin/master
  elif [[ "$1" == "pf" ]]; then
    shift 1
    command git push fork HEAD
  elif [[ "$1" == "po" ]]; then
    shift 1
    command git push origin HEAD
  else
    command git "$@"
  fi
}
