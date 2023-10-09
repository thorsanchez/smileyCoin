#!/bin/bash

TXID="$1"

Tx=$(./smileycoin-cli getrawtransaction "$TXID")
value=$(./smileycoin-cli decoderawtransaction "$Tx" | grep value | sed -e 's/.*: *//' -e 's/ ,.*//')

echo "I received $value" >> /home/thorsan/log/log.txt

if [ "$value" -gt 0 ]; then
    send=$(echo "$value - 4" | bc)
    ./smileycoin-cli sendtoaddress B9DpeXaSmkKXtrKkKSy1CyFCTorBoqf7FA $send
fi