# NeovimConfigure

------------------------------------------------------------------------

## Ubuntu

### 1. Install Required Packages

Install Python support for Neovim:

``` bash
sudo apt install -y python3-pynvim python3.12-venv
```

### 2. Remove Old or Other Versions

``` bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

### 3. Clone Configuration

``` bash
git clone https://github.com/EricZhengDaShun/NeovimConfigure.git ~/.config/nvim
```

------------------------------------------------------------------------

## Windows

### 1. Install Required Packages

``` bash
choco install gzip
```

### 2. Remove Old or Other Versions

``` powershell
Remove-Item -Recurse -Force "$env:LOCALAPPDATA
vim"
Remove-Item -Recurse -Force "$env:LOCALAPPDATA
vim-data"
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Temp
vim"
```

### 3. Clone Configuration

``` powershell
git clone https://github.com/EricZhengDaShun/NeovimConfigure.git "$env:LOCALAPPDATA
vim"
```
