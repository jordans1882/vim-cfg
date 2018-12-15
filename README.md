# Jordan Schupbach's Neo/vim Configuration

## Features


## Screenshot

## Pre-requisites

## Install

**_1._** Let's clone this repo! Clone to `~/.config/nvim`,
we'll also symlink it for Vim:

```sh
mkdir ~/.config
git clone git://github.com/rafi/vim-config.git ~/.config/nvim
ln -s ~/.config/nvim ~/.vim
```

- _Note:_ If your system sets `$XDG_CONFIG_HOME`,
  use that instead of `~/.config` in the code above.
  Nvim follows the XDG base-directories convention.

**_2._** If you are a _first-time Neovim user_, you need the pynvim
packages. Don't worry, run the script provided:

```sh
cd ~/.config/nvim
./venv.sh
```

**_3._** Run `make test` to test your nvim/vim version and compatibility.

**_4._** Run `make` to install all plugins.

Enjoy!

### Recommended Linters


## Upgrade

Run `make update`

## User Custom Config

## Structure

- [config/](./config) - Configuration
  - [plugins/](./config/plugins) - Plugin configurations
  - [plugins.yaml](./config/plugins.yaml) - _**Plugins!**_
  - local.plugins.yaml - Custom user plugins
  - [vimrc](./config/vimrc) - Initialization
  - [init.vim](./config/init.vim) - `runtimepath` initialization
  - [general.vim](./config/general.vim) - General configuration
  - local.vim - Custom user settings
  - [neovim.vim](./config/neovim.vim) - Neovim specific setup
  - [mappings.vim](./config/mappings.vim) - Key-mappings
  - [theme.vim](./config/theme.vim) - Color-scheme and theme setup
  - [filetype.vim](./config/filetype.vim) - Language behavior
  - [terminal.vim](./config/terminal.vim) - Terminal configuration
- [ftplugin/](./ftplugin) - Language specific custom settings
- [plugin/](./plugin) - Customized small plugins
- [snippets/](./snippets) - Personal code snippets
- [themes/](./themes) - Themes! Combination of styles and color-scheme
- [filetype.vim](./filetype.vim) - Custom filetype detection

## Plugin Highlights

## Non Lazy-Loaded Plugins

Name           | Description
-------------- | ----------------------

## Lazy-Loaded Plugins

### Language

Name           | Description
-------------- | ----------------------

### Commands

Name           | Description
-------------- | ----------------------

### Interface

Name           | Description
-------------- | ----------------------

### Completion

Name           | Description
-------------- | ----------------------

### Denite

Name           | Description
-------------- | ----------------------

### Operators & Text Objects

Name           | Description
-------------- | ----------------------


## Custom Key-mappings


### File Operations

### Editor UI


### Window Management

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: Denite

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: NERDTree

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: Deoplete / Emmet

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: Commentary

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: Edge Motion

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: QuickHL

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: Expand-Region

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: Easymotion

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: ChooseWin

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: Bookmarks

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: Easygit

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: GitGutter

Key   | Mode | Action
----- |:----:| ------------------

### Plugin: Linediff

Key   | Mode | Action
----- |:----:| ------------------

### Misc Plugins

Key   | Mode | Action
----- |:----:| ------------------

## Credits & Contribution
