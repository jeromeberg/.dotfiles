#!/bin/bash
# macOS defaults — generated from current system settings
# Run: bash defaults.sh
# Then log out / restart for all changes to take effect

echo "Applying macOS defaults..."

# =============================================================================
# DOCK
# =============================================================================

# Don't autohide the dock
defaults write com.apple.dock autohide -bool false

# No autohide delay
defaults write com.apple.dock "autohide-delay" -float 0

# Autohide animation speed
defaults write com.apple.dock "autohide-time-modifier" -float 0.4

# Group apps by application in Exposé
defaults write com.apple.dock "expose-group-apps" -bool true

# Magnification on hover
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 65

# Tile (icon) size
defaults write com.apple.dock tilesize -int 33

# Launch animation
defaults write com.apple.dock launchanim -bool true

# Minimize into application icon
defaults write com.apple.dock "minimize-to-application" -bool true

# Dock position
defaults write com.apple.dock orientation -string "bottom"

# Don't show recent apps
defaults write com.apple.dock "show-recents" -bool false

# Show running app indicators
defaults write com.apple.dock "show-process-indicators" -bool true

# Don't rearrange spaces based on recent use
defaults write com.apple.dock "mru-spaces" -bool false

# Enable App Exposé gesture
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

# Enable Mission Control gesture
defaults write com.apple.dock showMissionControlGestureEnabled -bool true

# Bottom-right hot corner: disabled (1 = no action)
defaults write com.apple.dock "wvous-br-corner" -int 1
defaults write com.apple.dock "wvous-br-modifier" -int 0

# =============================================================================
# TRACKPAD
# =============================================================================

# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Click threshold (0 = light)
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

# Force click (haptic feedback)
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool true
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0
defaults write NSGlobalDomain "com.apple.trackpad.forceClick" -bool true

# Tracking speed (0-3, 3 = fastest)
defaults write NSGlobalDomain "com.apple.trackpad.scaling" -float 3

# Right click (two-finger tap)
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# Scroll & zoom
defaults write com.apple.AppleMultitouchTrackpad TrackpadScroll -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadHorizScroll -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadMomentumScroll -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool true

# Three-finger drag: disabled
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool false

# Gestures
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 3

# No drag lock
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false

# =============================================================================
# KEYBOARD
# =============================================================================

# Key repeat rate (2 = very fast)
defaults write NSGlobalDomain KeyRepeat -int 2

# Delay before repeat starts (15 = short)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable autocorrect / auto-substitutions
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Inline prediction (keep enabled)
defaults write NSGlobalDomain NSAutomaticInlinePredictionEnabled -bool true

# =============================================================================
# GLOBAL / UI
# =============================================================================

# Language order
defaults write NSGlobalDomain AppleLanguages -array "en-US" "fr-FR" "he-FR"

# Show all file extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Click scrollbar to jump to clicked spot
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true

# Auto light/dark mode
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Double-click window title bar: Fill (not minimize)
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Fill"
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false

# Spring-loaded folders
defaults write NSGlobalDomain "com.apple.springing.enabled" -bool true
defaults write NSGlobalDomain "com.apple.springing.delay" -float 0.5

# No screen flash for alerts
defaults write NSGlobalDomain "com.apple.sound.beep.flash" -int 0

# =============================================================================
# APPLY
# =============================================================================

killall Dock Finder SystemUIServer 2>/dev/null

echo "Done. Some changes may require a logout/restart."