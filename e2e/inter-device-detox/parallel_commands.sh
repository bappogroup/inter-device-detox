#!/bin/bash

# https://stackoverflow.com/questions/10909685/run-parallel-multiple-commands-at-once-in-the-same-terminal
# by Alessandro Pezzato
# Modified by Stanley Luo

for cmd in "$@"; do {
  echo "Process \"$cmd\" started";
  $cmd & pid=$!
  PID_LIST+=" $pid";
} done

trap "kill $PID_LIST" SIGINT

echo "Parallel processes have started$PID_LIST";

wait $PID_LIST

echo
echo "All processes have completed";
kill -9 8335
