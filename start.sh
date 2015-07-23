#!/bin/bash

if [ "$#" -ne 1 ]
then
    supybot-wizard --allow-root
else
    supybot --allow-root "$1"
fi
