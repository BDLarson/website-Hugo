#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

rm -rf public/*

# Build the project.
hugo -t hugo-creative-theme

# Go To Public folder
cd public

mv * ~/Documents/GitRepos/deployed-hugo-website/

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

git commit -m "$msg"

# Push source and build repos.
git push origin master

cd ~/Documents/GitRepos/deployed-hugo-website/
git add .
git commit -m "$msg"
git push origin master
cd ~/Documents/GitRepos/website-Hugo/bookshelf/
