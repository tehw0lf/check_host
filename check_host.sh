#!/usr/bin/env bash
# script to check if a host is up
# option to loop

declare LOOP=0

if [[ "$1" == "" ]]; then
  echo "Argument required: Host to check - e.g. google.com"
  exit
else
  declare HOST="$1"
fi

if [[ "$2" == "loop" ]]; then
  LOOP=1
fi

check_host() {
  REQ=$(wget --spider --server-response --timeout=5 -t 1 "$HOST" 2>&1 | grep '200\ OK' | wc -l)
  if [ $REQ -eq 1 ]; then
    echo "Host $HOST is up! Exiting."
    tput bel
    exit
  else
    echo "Host $HOST is down."
  fi
}

if [ $LOOP -eq 1 ]; then
  while true; do
    check_host
  done
else
  check_host
fi

exit
