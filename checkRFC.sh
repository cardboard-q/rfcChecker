#!/bin/bash

PORT=5000
FAILED='failed'
PASSED='passed'

chkGet=$(curl localhost:$PORT -s | grep -e='*.')
retGet=$(if (test ${#chkGet} -ne 0 ); then echo "$PASSED"; else echo "$FAILED"; fi)

chkTraversal=$(curl --path-as-is localhost:$PORT/../ -s --head | grep "HTTP/1.0 404")
retTraversal=$(if (test ${#chkTraversal} -ne 0 ); then echo "$PASSED"; else echo "$FAILED"; fi)

chkPost=$(curl localhost:$PORT -s -H "Content-Type: text/plain" -d "mic check"| grep 'mic check')
retPost=$(if (test ${#chkPost} -ne 0 ); then echo "$PASSED"; else echo "$FAILED"; fi)

echo "task1: $retGet"
echo "task4: $retTraversal"
echo "task8: $retPost"
