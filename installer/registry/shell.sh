#!/usr/bin/env bash
# Shell configuration — aliases and plugin definitions

# Alias groups — pipe-delimited: "alias_name|command"
GIT_ALIAS_ENTRIES=(
  "ga|git add"
  "gaa|git add ."
  "gcm|git commit -m"
  "gpsh|git push"
  "gpsho|git push -u origin"
  "gpl|git pull"
  "gs|git status"
  "gss|git status -s"
  "glog|git log --oneline --graph --decorate"
  "gb|git branch"
  "gco|git checkout"
  "gcb|git checkout -b"
  "gd|git diff"
  "gst|git stash"
  "gstp|git stash pop"
)

GENERAL_ALIAS_ENTRIES=(
  "c|clear"
  "o|open ."
  "ll|ls -alF"
  "la|ls -A"
  "l|ls -CF"
  "sz|source ~/.zshrc"
  "..|cd .."
  "...|cd ../.."
)

DOCKER_ALIAS_ENTRIES=(
  "d|docker"
  "dps|docker ps"
  "dc|docker compose"
  "dcu|docker compose up"
  "dcd|docker compose down"
  "dcud|docker compose up -d"
)

PNPM_ALIAS_ENTRIES=(
  "p|pnpm"
  "pi|pnpm install"
  "pa|pnpm add"
  "pd|pnpm dev"
  "pb|pnpm build"
  "pr|pnpm run"
)

# Generate alias block from entries
generate_alias_block() {
  local header="$1"
  shift
  local entries=("$@")
  local block=""
  block="# ${header}"$'\n'
  for entry in "${entries[@]}"; do
    local alias_name="${entry%%|*}"
    local alias_cmd="${entry#*|}"
    block+="alias ${alias_name}='${alias_cmd}'"$'\n'
  done
  echo "$block"
}

# Oh My Zsh plugins
OMZ_BUILTIN_PLUGINS="git docker node npm z"
OMZ_CUSTOM_PLUGINS="zsh-autosuggestions zsh-syntax-highlighting"

OMZ_CUSTOM_PLUGIN_REPOS_KEYS=(zsh-autosuggestions zsh-syntax-highlighting)
OMZ_CUSTOM_PLUGIN_REPOS_URLS=(
  "https://github.com/zsh-users/zsh-autosuggestions"
  "https://github.com/zsh-users/zsh-syntax-highlighting"
)

install_omz_custom_plugins() {
  local plugin_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"
  local i=0
  for plugin in "${OMZ_CUSTOM_PLUGIN_REPOS_KEYS[@]}"; do
    local repo="${OMZ_CUSTOM_PLUGIN_REPOS_URLS[$i]}"
    local dest="${plugin_dir}/${plugin}"
    if [[ ! -d "$dest" ]]; then
      git clone "$repo" "$dest" 2>/dev/null
    fi
    ((i++))
  done
}
