# dotconfig

## Update Script

Run this update srcipt to update your nvim config.

```bash
#!/bin/bash

FLAG=$1

INSTALL=(nvim-config tmux)

GIT_URL="https://github.com/niemand8080/dotconfig"
REPO_DIR="$HOME/.local/share/dotconfig"
CONFIG_DIR="$HOME/.config"

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
        exit 0
    fi
fi

echo "Syncing dotconfig..."
for dir in "$REPO_DIR/*"; do
    if [ -d "$dir" ]; then
        echo "$dir"
    fi
        echo "$dir"
done
# rsync -av --delete "$REPO_DIR/src/" "$NVIM_CONFIG_DIR/"

echo "Successfully updated dotconfig!"
```
