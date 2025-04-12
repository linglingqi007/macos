#!/usr/bin/env bash

# 检查是否已安装 Homebrew
if ! command -v brew &>/dev/null; then
  echo "正在安装 Homebrew..."

  # 下载并安装 Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # 根据芯片类型设置不同的环境变量
  if [[ $(uname -m) == 'arm64' ]]; then
    # Apple Silicon (M1/M2) Mac
    echo '# Homebrew路径设置' >>~/.zshrc
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    # Intel Mac
    echo '# Homebrew路径设置' >>~/.zshrc
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >>~/.zshrc
    eval "$(/usr/local/bin/brew shellenv)"
  fi

  echo "Homebrew 安装完成"
else
  echo "Homebrew 已经安装"
fi

# 更新 Homebrew
brew update

# 安装 zsh 并设置为默认 shell
if ! brew list zsh &>/dev/null; then
  echo "正在安装 zsh..."
  brew install zsh
else
  echo "zsh 已经安装"
fi

if [[ $(uname -m) == 'arm64' ]]; then
  # Apple Silicon (M1/M2) Mac
  sudo dscl . -create /Users/"$USER" UserShell /opt/homebrew/bin/zsh
else
  # Intel Mac
  sudo dscl . -create /Users/"$USER" UserShell /usr/local/bin/zsh
fi

echo "zsh 安装完成并设置为默认 shell"

# 安装 Command Line Tools
if ! xcode-select -p &>/dev/null; then
  echo "正在安装 Command Line Tools..."
  xcode-select --install

  # 等待安装完成
  while ! xcode-select -p &>/dev/null; do
    sleep 1
  done

  echo "Command Line Tools 安装完成"
else
  echo "Command Line Tools 已经安装"
fi

# 安装字体
echo "正在安装字体..."
brew install font-jetbrains-mono font-hack-nerd-font
echo "字体安装完成"
