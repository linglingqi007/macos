# default shell
dscl . -read /Users/$USER UserShell # show current shell
sudo dscl . -create /Users/$USER UserShell /opt/homebrew/bin/zsh # set default shell

# keyboard
defaults write -g ApplePressAndHoldEnabled -bool false # disable key hold
defaults write -g InitialKeyRepeat -int 10 # delay before repeat 
defaults write -g KeyRepeat -int 1 # repeat
defaults write -g AppleKeyboardUIMode -int 2 # navigation

# launchpad
defaults write com.apple.dock springboard-rows -int 7 # launchpad rows
defaults write com.apple.dock springboard-columns -int 7 # launchpad columns
defaults write com.apple.dock ResetLaunchPad -bool true # reset arrange

# dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock showhidden -bool true # transtransparentize icons of hidden apps (⌘H)
defaults write com.apple.dock orientation -string left # dock on left
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock persistent-apps -array "" # unpind apps

# icloud
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool true # disable save to icloud

# finder
defaults write com.apple.finder QuitMenuItem -bool true # Allow quitting via ⌘Q
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # disable warning when changing a file extension
defaults write com.apple.finder AppleShowAllExtensions -bool true # show all files extensions
defaults write com.apple.finder AppleShowAllFiles -bool true # show all files 
defaults write com.apple.finder ShowPathbar -bool true # show path bar
defaults write com.apple.finder FXPreferredViewStyle -string clmv # layout as multi-column

# keep the desktop clean
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

defaults write com.apple.finder _FXSortFoldersFirst -bool true # show directories first

# new window use the $HOME path
defaults write com.apple.finder NewWindowTarget -string PfHm
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"

defaults write com.apple.finder QLEnableTextSelection -bool true # allow text selection in Quick Look
defaults write com.apple.finder FXInfoPanesExpanded -dict MetaData -bool true Preview -bool # show metadata info, but not preview in info panel

# trackpad tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# enable 3-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# desktop

# avoid creating .DS_Store files on USB or network volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# security
sudo spctl --master-disable # allow open all apps