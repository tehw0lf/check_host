# check_host
Simple bash script to check if a host is up, with an option to loop until it is up


Usage:
`./check_host.sh $HOST` -> check once if $HOST is up

`./check_host.sh $HOST loop`-> check if $HOST is up until it is up or the script gets killed manually

Currently "only" for macOS, for Linux please replace `tput bel` with `beep`.
