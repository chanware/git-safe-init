#!/bin/zsh

# --- Colors ---
RED=$'%F{red}'
GREEN=$'%F{green}'
YELLOW=$'%F{yellow}'
RESET=$'%f'

# --- Check if we're already inside a git repo ---
if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "${RED}Error:${RESET} This folder is already part of a git repository."
  echo "Use ${YELLOW}git status${RESET} to check."
  exit 1
fi

# --- Show where you are ---
echo "${YELLOW}You are in:${RESET} $(pwd)"

# --- Confirm before doing dumb things ---
read -r "choice?${GREEN}Are you SURE you want to 'git init' here? (y/n): ${RESET}"
if [[ $choice == "y" || $choice == "Y" ]]; then
  git init
else
  echo "${RED}Aborted.${RESET} No changes made."
fi