#!/bin/bash

function reportError() {
  if [ $1 -ne 0 ]; then
    echo $2
    exit $1
  fi
}

done_signal="/scripts/done-process"

if [ ! -f "$done_signal" ]; then
  ./init.sh
  reportError $? "test 1 failed"
fi
if [ ! -f "$done_signal" ]; then
  ./create-user.sh
  reportError $? "test 2 failed"
fi
touch $done_signal
echo "done"
