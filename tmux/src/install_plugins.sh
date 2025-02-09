#!/bin/bash

# Wait until the signal "session_ready" is sent
tmux wait-for session_ready

# Install plugins
tmux send-keys -t 1 ~/.tmux/plugins/tpm/scripts/install_plugins.sh Enter
