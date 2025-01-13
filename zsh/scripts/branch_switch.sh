#!/bin/bash

# Check if fzf is installed
if ! command -v fzf &> /dev/null; then
    echo "fzf could not be found. Please install it first."
    exit 1
fi

# Get the list of branches
branches=$(git branch --format='%(refname:short)' | fzf --border --ansi)

# Check if a branch was selected
if [[ -n "$branches" ]]; then
    # Checkout the selected branch
    git checkout "$branches"
else
    echo "No branch selected."
    exit 1
fi

