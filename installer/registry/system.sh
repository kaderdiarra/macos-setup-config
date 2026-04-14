#!/usr/bin/env bash
# macOS system settings — pipe-delimited: "key|Display Label|domain|setting_key|value_type|value"

SYSTEM_ENTRIES=(
  "dock-autohide|Dock: Auto-hide|com.apple.dock|autohide|bool|true"
  "dock-size|Dock: Smallest size|com.apple.dock|tilesize|int|36"
  "dock-position|Dock: Position left|com.apple.dock|orientation|string|left"
  "dock-no-recents|Dock: No recent apps|com.apple.dock|show-recents|bool|false"
  "dock-no-animate|Dock: No open animation|com.apple.dock|launchanim|bool|false"
  "desktop-no-icons|Desktop: Hide icons|com.apple.finder|CreateDesktop|bool|false"
  "desktop-no-wallpaper-click|Desktop: No wallpaper click reveal|com.apple.WindowManager|EnableStandardClickToShowDesktop|bool|false"
  "finder-list-view|Finder: List view default|com.apple.finder|FXPreferredViewStyle|string|Nlsv"
  "finder-path-bar|Finder: Show path bar|com.apple.finder|ShowPathbar|bool|true"
  "finder-status-bar|Finder: Show status bar|com.apple.finder|ShowStatusBar|bool|true"
  "finder-folders-top|Finder: Folders on top|com.apple.finder|_FXSortFoldersFirst|bool|true"
  "finder-search-scope|Finder: Search current folder|com.apple.finder|FXDefaultSearchScope|string|SCcf"
  "finder-no-ext-warning|Finder: No extension warning|com.apple.finder|FXEnableExtensionChangeWarning|bool|false"
)

apply_system_setting() {
  local entry="$1"
  local domain setting_key value_type value
  domain=$(get_field "$entry" 3)
  setting_key=$(get_field "$entry" 4)
  value_type=$(get_field "$entry" 5)
  value=$(get_field "$entry" 6)

  case "$value_type" in
    bool)   defaults write "$domain" "$setting_key" -bool "$value" ;;
    int)    defaults write "$domain" "$setting_key" -int "$value" ;;
    float)  defaults write "$domain" "$setting_key" -float "$value" ;;
    string) defaults write "$domain" "$setting_key" -string "$value" ;;
  esac
}

restart_affected_apps() {
  killall Dock 2>/dev/null || true
  killall Finder 2>/dev/null || true
}

apply_dock_speed() {
  defaults write com.apple.dock autohide-delay -float 0
  defaults write com.apple.dock autohide-time-modifier -float 0.4
}
