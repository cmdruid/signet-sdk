#!/usr/bin/env sh
## Start script for bitcoind.

set -E

###############################################################################
# Environment
###############################################################################

pwd="$(pwd)"
bitcoind="$pwd/bin/bitcoind"
logfile="$pwd/debug.log"
config="-conf=$pwd/bitcoin.conf -datadir=$pwd/data -debuglogfile=$logfile"

###############################################################################
# Script
###############################################################################

## Start bitcoind then tail the logfile to search for the completion phrase.
echo "Starting bitcoin daemon at: $bitcoind $logfile"
$bitcoind $config > /dev/null 2>&1; tail -f $logfile | while read line; do
  echo "$line" && echo "$line" | grep "init message: Done loading" > /dev/null 2>&1
  if [ $? = 0 ]; then 
    echo "Bitcoin core loaded!" && exit 0
  fi
done

## Start mining script.
# /miner &