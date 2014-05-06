#!/bin/sh

# Automate Github authentication
ssh-keyscan -H github.com > ~/.ssh/known_hosts

# Clone the RSpec Example repository
git clone git@github.com:petersellars/rspec-book-examples.git

# Configure Git user
cd rspec-book-examples
git config --global user.name $1
git config --global user.email $2