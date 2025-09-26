#!/usr/bin/env bash
set -euo pipefail


# Nerd Font cask (any from homebrew/cask-fonts)
: "${NERD_FONT_CASK:=font-jetbrains-mono-nerd-font}"

### ----------------------------
### Helpers
### ----------------------------
have_cmd() { command -v "$1" >/dev/null 2>&1; }

brew_install() {
  local pkg="$1"
  if brew list --formula --versions "$pkg" >/dev/null 2>&1; then
    echo "✓ $pkg already installed"
  else
    echo "➤ Installing $pkg"
    brew install "$pkg"
  fi
}

brew_cask_install() {
  local cask="$1"
  if brew list --cask --versions "$cask" >/dev/null 2>&1; then
    echo "✓ $cask already installed"
  else
    echo "➤ Installing cask $cask"
    brew install --cask "$cask"
  fi
}

brew_tap_if_needed() {
  local tap="$1"
  if brew tap | grep -q "^${tap}\$"; then
    echo "✓ tap $tap already added"
  else
    echo "➤ Adding tap $tap"
    brew tap "$tap"
  fi
}

need_xcode_cli() {
  # Returns 0 if Xcode CLI tools are missing
  ! xcode-select -p >/dev/null 2>&1
}

### ----------------------------
### Homebrew
### ----------------------------
if ! have_cmd brew; then
  echo "➤ Homebrew not found. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Initialize brew for current shell session:
  if [[ -d "/opt/homebrew/bin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -d "/usr/local/bin" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    echo "⚠ Could not auto-initialize Homebrew in your shell. You may need to add it to PATH manually."
  fi
else
  echo "✓ Homebrew already installed"
fi

echo "➤ Updating Homebrew..."
brew update

### ----------------------------
### Xcode Command Line Tools (for make/clang, etc.)
### ----------------------------
if need_xcode_cli; then
  echo "⚠ Xcode Command Line Tools are not installed."
  echo "  They provide compilers and tools like 'make' and 'clang' used by many packages."
  echo "  Install them by running: xcode-select --install"
  echo "  (You can run this script again after installing.)"
else
  echo "✓ Xcode Command Line Tools detected"
fi

brew_install git
brew_install make
brew_install unzip
brew_install gcc
brew_install ripgrep
brew_install fd
brew_install bat
brew_install eza
brew_install fzf
brew_install jq
brew_install neovim
brew_install tree-sitter
brew_install zoxide
brew_install starship
brew_install lazygit

### ----------------------------
### Clipboard tool (macOS)
### ----------------------------
# macOS already has pbcopy/pbpaste; for tmux users, reattach-to-user-namespace helps clipboard behavior.
brew_install reattach-to-user-namespace
# Optional: pngpaste adds image clipboard support in CLI (handy but not required)
if brew list --formula --versions pngpaste >/dev/null 2>&1; then
  echo "✓ pngpaste already installed"
else
  echo "➤ Installing optional pngpaste"
  brew install pngpaste
fi

brew_cask_install "$NERD_FONT_CASK"
brew_cask_install ghostty
brew_cask_install raycast
brew_cask_install wezterm
brew_cask_install zen
brew_cask_install visual-studio-code


### ----------------------------
### Summary
### ----------------------------
echo
echo "✅ All done!"
