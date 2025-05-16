# 🛡️ git-safe-init

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Shell: Zsh](https://img.shields.io/badge/Shell-Zsh-green.svg)](https://www.zsh.org/)
[![Git Extension](https://img.shields.io/badge/Git-Extension-f05032.svg?logo=git)](https://git-scm.com/)

A safety wrapper for `git init` that prevents common mistakes.

## What Problem Does This Solve?

If you've ever accidentally initialized a git repository in the wrong directory (like your parent "repos" folder), you know the headache that follows. This script adds a confirmation layer to prevent those mistakes.

## Features

- Detects if you're already inside an existing git repo
- Shows your current working directory for verification
- Requires explicit confirmation before proceeding
- Works as a proper git subcommand (`git safe-init`)
- Includes visual formatting to highlight important information

## Installation

### Option 1: Direct Download

1. Create a personal bin directory (if you don't already have one):
   ```bash
   mkdir -p ~/bin
   ```
   > The `-p` flag creates parent directories as needed and doesn't error if the directory already exists - helpful for idempotent scripts.

2. Download the script:
   ```bash
   curl -o ~/bin/git-safe-init https://raw.githubusercontent.com/chanware/git-safe-init/main/git-safe-init.sh
   ```

3. Make it executable:
   ```bash
   chmod +x ~/bin/git-safe-init
   ```

4. Ensure ~/bin is in your PATH:
   ```bash
   # Check if it's already there
   echo $PATH | grep -q "$HOME/bin" && echo "Already in PATH" || echo "Not in PATH"
   
   # Add to PATH if needed (for zsh)
   echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
   source ~/.zshrc
   ```

### Option 2: Clone the Repo

1. Clone this repository:
   ```bash
   git clone https://github.com/chanware/git-safe-init.git
   ```

2. Create a symlink to your bin directory:
   ```bash
   mkdir -p ~/bin
   ln -s "$(pwd)/git-safe-init/git-safe-init.sh" ~/bin/git-safe-init
   ```

3. Ensure ~/bin is in your PATH (see Option 1, step 4)

## Usage

Simply run:
```
git safe-init
```

| Command | Safety | Status |
|---------|--------|--------|
| `git safe-init` | With confirmation | ✅ Safe |
| `git init` | No safety checks | ⚠️ Use with caution |

### Example Output

When run in a new directory:
```
You are in: /Users/you/projects/new-project
Are you SURE you want to 'git init' here? (y/n): y
Initialized empty Git repository in /Users/you/projects/new-project/.git/
```

When already inside a git repository:
```
Error: This folder is already part of a git repository.
Use git status to check.
```

## How It Works

This uses Git's subcommand mechanism, where executables named `git-*` in your PATH become available as `git *` commands. The script performs safety checks before delegating to the actual `git init` command.

## Why Not Just an Alias?

While you could create a shell alias, this approach:
- Works consistently across different shell environments
- Follows Git's established extension pattern
- Is easier to share with others
- Doesn't require modifying shell configs on each machine

## Technical Notes

The script uses zsh by default. If you prefer bash, change the shebang line from `#!/bin/zsh` to `#!/bin/bash` and modify the color formatting.
