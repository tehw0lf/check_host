#!/usr/bin/env bash
# script to check if a host is up
# option to loop

check_host() {
  REQ=$(wget --spider --server-response --timeout=5 -t 1 "$HOST" 2>&1 | grep '200\ OK' | wc -l)
  if [ $REQ -eq 1 ]; then
    host_up
  else
    host_down
  fi
}

host_down() {
  echo "Host $HOST is down."
}

host_up() {
  if [[ "$CURRENT_OS" == "Darwin" ]]; then
    echo "Host $HOST is up! Exiting."
    tput bel
    say "Host $HOST is up! Exiting."
  elif [[ "$CURRENT_OS" == "Linux" || "$CURRENT_OS" == "CYGWIN" || "$CURRENT_OS" == "MINGW" ]]; then
    echo "Host $HOST is up! Exiting."
    bell
  fi
  exit
}

CURRENT_OS="$(uname -s)"

if [[ "$1" == "" ]]; then
  echo "Argument required: Host to check - e.g. google.com"
  exit
else
  declare HOST="$1"
fi

if [[ "$2" == "loop" ]]; then
  while true; do
    check_host
  done
else
  check_host
fi

exit
