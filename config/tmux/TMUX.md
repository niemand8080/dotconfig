# TMUX

## Requirements

You have to install the [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Installation

After running the [update script](https://github.com/niemand8080/dotconfig?tab=readme-ov-file#update-script), you can start a new tmux session and then source the tmux conf file. After you have done this you need to press the `prefix` key (Ctrl + Space) and then Shift + i (I) to install the Tmux Plugin Manager.

```shell
# new tmux session
tmux new

# source tmux conf
tmux source ~/.config/tmux/tmux.conf

# now press Ctrl + Space and then Shift + I
```

## Tips

If you are on Mac (I don't know if its the same for other OS) make sure you disable any Ctrl + Space keybinds in the Systemsettings > Keyboard > Input Sources. I spend more than 1 hour finding this out...
