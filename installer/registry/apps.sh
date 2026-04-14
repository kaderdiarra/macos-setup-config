#!/usr/bin/env bash
# App registry — pipe-delimited: "key|Display Name|brew_install_args|check_type|check_value|description"

APP_ENTRIES=(
  "alttab|AltTab|--cask alt-tab|app|/Applications/AltTab.app|Windows-style alt-tab with window previews"
  "arc|Arc|--cask arc|app|/Applications/Arc.app|Clean Chromium-based browser with sidebar tabs"
  "dbeaver|DBeaver|--cask dbeaver-community|app|/Applications/DBeaver.app|Universal database management tool"
  "hidden-bar|Hidden Bar|--cask hiddenbar|app|/Applications/Hidden Bar.app|Free menu bar icon manager"
  "iterm2|iTerm2|--cask iterm2|app|/Applications/iTerm.app|Feature-rich terminal emulator"
  "itsycal|itsycal|--cask itsycal|app|/Applications/Itsycal.app|Tiny menu bar calendar"
  "kap|Kap|--cask kap|app|/Applications/Kap.app|Open-source screen recorder"
  "keka|Keka|--cask keka|app|/Applications/Keka.app|File archiver (7z, ZIP, RAR)"
  "notchnook|NotchNook|--cask notchnook|app|/Applications/NotchNook.app|MacBook notch utility area"
  "raycast|Raycast|--cask raycast|app|/Applications/Raycast.app|Spotlight replacement"
  "rectangle|Rectangle|--cask rectangle|app|/Applications/Rectangle.app|Window management with shortcuts"
  "stats|Stats|--cask stats|app|/Applications/Stats.app|Menu bar system monitor"
  "sublime-text|Sublime Text|--cask sublime-text|app|/Applications/Sublime Text.app|Fast lightweight text editor"
  "time-out|Time Out|--cask time-out|app|/Applications/Time Out.app|Break timer for strain prevention"
)

# Field accessors — usage: get_app_field "entry_string" field_index
# Fields: 0=key 1=name 2=brew_args 3=check_type 4=check_value 5=description
get_field() {
  echo "$1" | cut -d'|' -f"$2"
}

get_app_keys() {
  for entry in "${APP_ENTRIES[@]}"; do
    get_field "$entry" 1
  done
}

find_app_entry() {
  local search_key="$1"
  for entry in "${APP_ENTRIES[@]}"; do
    local key
    key=$(get_field "$entry" 1)
    if [[ "$key" == "$search_key" ]]; then
      echo "$entry"
      return
    fi
  done
}
