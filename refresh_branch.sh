#!/bin/bash

branch=$(git symbolic-ref --short HEAD)

git checkout "$branch"
git fetch origin
git pull origin "$branch"

fortune | cowsay