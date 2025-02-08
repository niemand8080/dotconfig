# TMUX

## Requirements

You have to install the [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Installation

After running the [update script](https://github.com/niemand8080/dotconfig?tab=readme-ov-file#update-script), you can start a new tmux session and then source the tmux conf file.

```shell
# new tmux session
tmux new

# source tmux conf
tmux source ~/.config/tmux/tmux.conf
```
