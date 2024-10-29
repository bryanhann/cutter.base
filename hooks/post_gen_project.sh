#!/usr/bin/env bash

./SETUP.sh && {
    git rm ./SETUP.sh
    git add .
    git commit -m "Remove SETUP.sh"
    git status
    ./bump
} || {
    echo SETUP FAIILED. TRY MANUAL SETUP > Readme.ERROR
}
