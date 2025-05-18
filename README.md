# tmux-floating-terminal

Some times you need a scratch terminal. tmux-floating-terminal will quickly load a floating pane with a new tmux session. This floating pane can be detached and reattached.

## Requirements

* [tmux](https://github.com/tmux/tmux) >= 3.2

## Supports:

-   Linux
-  *macOS
-  *Cygwin
-  *Windows Subsystem for Linux (WSL)

\* untested, should work.

## Installation via (recommended) [TPM](https://github.com/tmux-plugins/tpm)

Add plugin to the list of TPM plugins in `~/.tmux.conf`:

```
set -g @plugin 'lloydbond/tmux-floating-terminal'

<optional>
set -g @floating_scratch_term 'M-i'
set -g @floating_scratch_to_active_win 'M-h'
set -g @floating_scratch_to_win 'M-l'
set -g @floating_active_pane_to_scratch 'M-m'

```
Hit <kbd>tmux-prefix</kbd> + <kbd>I</kbd> to fetch the plugin and source it. You should now be able to use the plugin.

## Manual Installation

Clone the repository:

```
git clone https://github.com/lloydbond/tmux-floating-terminal.git ~/.tmux-floating-terminal
```
Add the following to `.tmux.conf`:

```
run-shell ~/.tmux-floating-terminal/floating_plugin.tmux
```

Reload tmux:

```
tmux source-file ~/.tmux.conf
```

## Usage

* Open/Close scratch terminal <kbd>tmux-prefix</kbd> <kbd>alt</kbd> + <kbd>i</kbd>
* Convert scratch terminal to active window <kbd>tmux-prefix></kbd> <kbd>alt</kbd> + <kbd>h</kbd>
* Convert scratch terminal to next-window <kbd>tmux-prefix></kbd> <kbd>alt</kbd> + <kbd>l</kbd>
* Convert convert current pane into popup scratech <kbd>tmux-prefix></kbd> <kbd>alt</kbd> + <kbd>m</kbd>
  - Note: scratch popup must be unused for now. Will improve funcitonality to play fairly in the future.

## Inspiration / Influence

* [u/kevinhwang91](https://www.reddit.com/r/tmux/comments/itonec/comment/g5jxke4/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
* [u/meain](https://blog.meain.io/2020/tmux-flating-scratch-terminal/)
