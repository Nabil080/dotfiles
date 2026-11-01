# dotfiles

My setup for Zsh, Neovim, Tmux and code formatting.

## What's inside

| Folder or file | What it holds |
| --- | --- |
| `nvim/` | Neovim config: LSP with Mason, completion, Telescope, Treesitter, formatting and linting, with plugins managed by lazy.nvim |
| `zshrc/` | Zsh aliases, functions, options and environment |
| `.tmux.conf` | Tmux config, with `Ctrl+a` as the prefix |
| `format/` | `.clang-format` and `.prettierrc` |
| `godot-itch-push.bat` | Windows script that exports a Godot project and pushes it to itch.io |

## Install

```bash
git clone https://github.com/Nabil080/dotfiles.git
cd dotfiles
./install.sh
```

`install.sh` creates symbolic links in your home folder, so any change made locally shows up in the repo. It also installs [TPM](https://github.com/tmux-plugins/tpm) for Tmux plugins.

Existing files with the same names are replaced, so back up your own config first.

The Zsh files are not loaded automatically yet: source them from your `.zshrc`.
