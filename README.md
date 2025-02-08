# dotconfig

Just some config so I can share them between computers.

## Requirements

Read the requirements for each config.

1. [nvim](https://github.com/niemand8080/dotconfig/blob/main/nvim/NVIM.md)
2. [tmux](https://github.com/niemand8080/dotconfig/blob/main/tmux/TMUX.md)

## Installation

To install all configs just copy the [update script](https://github.com/niemand8080/dotconfig?tab=readme-ov-file#update-script) into a file, and then execute the file. This will automatically install all configs in the $HOME/.config directory.
You add and remove the configs you want or dont want to install from the INSTALL variable in the [update script](https://github.com/niemand8080/dotconfig?tab=readme-ov-file#update-script) (You can change all variables to fit your need).

### Update Script

Run this update srcipt to update your nvim config. You can add and remove those configs you want to install.

```bash
#!/bin/bash

FLAG=$1

INSTALL=( nvim tmux ) # add those you want to update, remove the others

GIT_URL="https://github.com/niemand8080/dotconfig"
REPO_DIR="$HOME/.local/share/dotconfig"
CONFIG_DIR="$HOME/.config"

mkdir -p "$HOME/.local/share"

if [[ ! -d "$REPO_DIR" ]]; then
    if [[ $FLAG == "force" ]]; then
        echo "Cloning dotconfig repository"
        git clone "$GIT_URL" "$REPO_DIR"
    else
        printf "Make sure you coppied your configs. They will be overwritten.\nRun the script with a \"force\" parameter.\nExample: ./update-dotconf.sh force\n"
        exit 1
    fi
else
    # Pull latest changes if repo exists
    cd "$REPO_DIR" || exit
    git fetch origin
    
    # Check for updates
    if git status -uno | grep -q "Your branch is behind"; then
        echo "Updated found. Pulling latest changes"
        git pull origin main
    else 
        echo "Dotconfig already up to date."
        if [[ $FLAG != "force" ]]; then
            exit 0
        fi
    fi
fi

echo "Syncing dotconfig..."

while IFS= read -d $'\0' -r file ; do 
    name="${file/$REPO_DIR\//}"
    if $(echo "${INSTALL[@]}" | grep -q "$name"); then
        echo "Updateing $name config.."
        rsync -a --delete "$REPO_DIR/$name/src/" "$CONFIG_DIR/$name/"
        echo "$?"
        if [ $? ]; then
            echo "Successfully updated $name config!"
        else
            echo "Error updating $name config"
        fi
    fi
done < <(find "$REPO_DIR" -mindepth 1 -maxdepth 1 -type d ! -iname ".*" -print0)

echo "Successfully updated dotconfig!"
```
