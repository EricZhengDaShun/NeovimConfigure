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

### 4. Remove git

```bash
rm -rf ~/.config/nvim/.git
```

### Go Debug Example

#### 1. Start the debug program `hello`

```bash
dlv exec ./hello --listen=:2345 --headless=true --api-version=2
```

#### 2. Attach to the remote process using Neovim
 
------------------------------------------------------------------------

## Windows

### 1. Install Required Packages

``` bash
choco install gzip
```

### 2. Remove Old or Other Versions

``` powershell
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim"
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim-data"
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\Temp\nvim"
```

### 3. Clone Configuration

``` powershell
git clone https://github.com/EricZhengDaShun/NeovimConfigure.git "$env:LOCALAPPDATA\nvim"
```

### 4. Remove git

``` powershell
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim\.git"
```