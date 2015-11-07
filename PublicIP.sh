#!/bin/bash

#For displaying public IP
curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//

