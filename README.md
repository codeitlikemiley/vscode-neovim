# VsCode + Neovim Setup For Rust <3

## Installation

1. Clone repo
```sh
git clone https://github.com/codeitlikemiley/vscode-neovim
cd vscode-neovim
```

2. Install dependencies

```sh
chmod + x ./install.sh
./install.sh
```

3. Import VCode Profile

Its comes with all the plugins , modified  keymaps for ultimate productivity.

Download the [Goldcoders.code-profile](https://github.com/codeitlikemiley/vscode-neovim/blob/main/Goldcoders.code-profile)

And Import it on VSCODE

## Made with 10X Productivity in mind

Vscode Built in Test Runner Sucks , no Option to use a Cargo Nextest , which takes advantage of Extra Cores.

Typing and Searching , and Selecting consumes a lot of time , Its better if you can just press one Magic Key

<kbd>CMD+R</kbd> Run Crates and Test Under Cursor with Cargo Nextest.

First Class Citizen Vim Keys Bindings for Quick Debugging

<kbd>OPT+H</kbd> Step out
<kbd>OPT+J</kbd> Step over
<kbd>OPT+K</kbd> Continue
<kbd>OPT+L</kbd> Step Into

For Launching Debuggables , <kbd>OPT+D</kbd> , it would detect your `Cargo.toml` just generate it if you dont have `.vscode/launch.json`

<kbd>CMD+OPT+D</kbd> Toggle Breakpoint and <kbd>CMD+OPT+K</kbd> Toggle Bookmark

All the Leftsidebar Menus are using
<kbd>CMD + [F1-f12] </kbd>

There are lot more keys That have been remapped for better workflow. I suggest you take a look at it on  `keymaps.json` after you Imported [Goldcoders.code-profile](https://github.com/codeitlikemiley/vscode-neovim/blob/main/Goldcoders.code-profile)


