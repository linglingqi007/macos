#!/usr/bin/env bash

# default shell
dscl . -read "/Users/${USER}" UserShell # 查看当前 shell
sudo dscl . -create "/Users/${USER}" UserShell /opt/homebrew/bin/zsh # 设置默认 shell

# keyboard
defaults write -g ApplePressAndHoldEnabled -bool false # 禁用按键长按
defaults write -g InitialKeyRepeat -int 10 # 重复初始延迟
defaults write -g KeyRepeat -int 1 # 重复延迟
defaults write -g AppleKeyboardUIMode -int 2 # 启用完全键盘控制,可以用 Tab 键切换所有控件
defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '<dict><key>InputSourceKind</key><string>TCIM</string><key>TISIntendedLanguage</key><string>zh-Hans</string><key>TISInputSourceID</key><string>com.apple.inputmethod.TCIM.WBX</string></dict>' # 添加中文86五笔输入法
defaults write com.apple.TextInputMenu visible -bool false # 隐藏状态栏的输入法图标
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false # 禁用连续空格插入句号

# launchpad
defaults write com.apple.dock springboard-rows -int 7 # launchpad 行数
defaults write com.apple.dock springboard-columns -int 7 # launchpad 列数
defaults write com.apple.dock ResetLaunchPad -bool true # 重置排列

# dock
defaults write com.apple.dock autohide -bool true # 自动隐藏 dock
defaults write com.apple.dock showhidden -bool true # 透明化隐藏应用图标
defaults write com.apple.dock orientation -string left # dock 在左侧
defaults write com.apple.dock show-recents -bool false # 不显示最近使用
defaults write com.apple.dock persistent-apps -array "" # 取消固定应用

# icloud
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool true # 禁用保存到 iCloud

# finder
# defaults write com.apple.finder QuitMenuItem -bool true # 允许通过 ⌘Q 退出
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # 禁用更改文件扩展名时的警告
defaults write com.apple.finder AppleShowAllExtensions -bool true # 显示所有文件扩展名
defaults write com.apple.finder AppleShowAllFiles -bool true # 显示所有文件
defaults write com.apple.finder ShowPathbar -bool true # 显示路径栏
defaults write com.apple.finder FXPreferredViewStyle -string clmv # 布局为多列
defaults write com.apple.finder NewWindowTarget -string PfHm # 新窗口使用 $HOME 路径
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/" # 新窗口使用 $HOME 路径
defaults write com.apple.finder QLEnableTextSelection -bool true # 允许在 Quick Look 中选择文本
defaults write com.apple.finder FXInfoPanesExpanded -dict MetaData -bool true Preview -bool true # 显示元数据信息,但不在信息面板中预览

# desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false # 不显示硬盘
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false # 不显示可移动媒体
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false # 不显示外部硬盘
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false # 不显示挂载的网络服务器
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true # 禁用 USB 上的 .DS_Store 文件
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true # 禁用网络上的 .DS_Store 文件
defaults write com.apple.finder _FXSortFoldersFirst -bool true # 目录优先

# trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true # 触控板点击
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true # 蓝牙触控板点击
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true # 启用三指拖拽
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true # 启用三指拖拽

# security
sudo spctl --master-disable # 允许打开所有来源应用

# default handler
duti -s com.microsoft.VSCode .c all
duti -s com.microsoft.VSCode .cpp all
duti -s com.microsoft.VSCode .cs all
duti -s com.microsoft.VSCode .css all
duti -s com.microsoft.VSCode .js all
duti -s com.microsoft.VSCode .json all
duti -s com.microsoft.VSCode .ts all
duti -s com.microsoft.VSCode .jsx all
duti -s com.microsoft.VSCode .sass all
duti -s com.microsoft.VSCode .scss all
duti -s com.microsoft.VSCode .less all
duti -s com.microsoft.VSCode .vue all
duti -s com.microsoft.VSCode .go all
duti -s com.microsoft.VSCode .java all
duti -s com.microsoft.VSCode .lua all
duti -s com.microsoft.VSCode .md all
duti -s com.microsoft.VSCode .php all
duti -s com.microsoft.VSCode .pl all
duti -s com.microsoft.VSCode .py all
duti -s com.microsoft.VSCode .rb all
duti -s com.microsoft.VSCode .rs all
duti -s com.microsoft.VSCode .sh all
duti -s com.microsoft.VSCode .txt all
duti -s com.microsoft.VSCode .conf all
duti -s com.microsoft.VSCode .cfg all
duti -s com.microsoft.VSCode .ass all
duti -s com.microsoft.VSCode .yml all
duti -s com.microsoft.VSCode .yaml all
