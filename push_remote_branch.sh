#!/bin/bash

branch=$(git symbolic-ref --short HEAD)
git push -u origin "$branch"

fortune | cowsay