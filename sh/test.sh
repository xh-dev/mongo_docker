#!/bin/bash

echo "===================="

function reportError() {
  if [ $1 -ne 0 ]; then
    echo $2
    exit $1
  fi
}

done_signal="/scripts/done-process"

if [ ! -f "$done_signal" ]; then
  /scripts/init.sh >> /scripts/op.log
  # /scripts/test-with-error.sh
  # /scripts/test-without-error.sh
  reportError $? "test 1 failed"
fi
if [ ! -f "$done_signal" ]; then
  /scripts/create-user.sh >> /scripts/op.log
  # /scripts/test-without-error.sh
  reportError $? "test 2 failed"
fi
touch $done_signal
echo "done"
