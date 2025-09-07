# Neovim Configuration

---

## Ubuntu

### 1. Remove Old Configuration

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

---

### 2. Clone Configuration

```bash
git clone https://github.com/EricZhengDaShun/NeovimConfigure.git ~/.config/nvim
```

---

### 3. Remove Git Metadata

```bash
rm -rf ~/.config/nvim/.git
```

---

### 4. Launch Neovim

```bash
nvim
```

---

## Windows

### 1. Remove Old Configuration

Delete the following directory if it exists:

```
Remove-Item -Recurse -Force "$env:LOCALAPPDATA\nvim"
```

---

### 2. Clone Configuration

Open **PowerShell** and run:

```powershell
git clone https://github.com/EricZhengDaShun/NeovimConfigure.git $env:LOCALAPPDATA\nvim
```

---

### 3. Remove Git Metadata

```powershell
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim\.git
```

---

### 4. Launch Neovim

In **PowerShell** or **Command Prompt**:

```powershell
nvim
```
