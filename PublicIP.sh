#!/bin/bash

#For displaying public IP
#curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//

curl http://ipecho.net/plain; echo
