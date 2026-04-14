#!/usr/bin/env bash
# ANSI color constants and styled output helpers

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

# Symbols
CHECK="${GREEN}✓${RESET}"
CROSS="${RED}✗${RESET}"
ARROW="${CYAN}→${RESET}"
WARN="${YELLOW}⚠${RESET}"
INFO="${BLUE}ℹ${RESET}"
SKIP="${GRAY}○${RESET}"
UP="${MAGENTA}↑${RESET}"
GEAR="${CYAN}⚙${RESET}"

print_success() { echo -e "  ${CHECK} $1"; }
print_error()   { echo -e "  ${CROSS} $1"; }
print_info()    { echo -e "  ${INFO} $1"; }
print_warn()    { echo -e "  ${WARN} $1"; }
print_arrow()   { echo -e "  ${ARROW} $1"; }
print_skip()    { echo -e "  ${SKIP} ${GRAY}$1${RESET}"; }
print_upgrade() { echo -e "  ${UP} $1"; }

print_header() {
  echo ""
  echo -e "${BOLD}${CYAN}$1${RESET}"
  echo -e "${CYAN}$(printf '%.0s─' $(seq 1 ${#1}))${RESET}"
}

print_step() {
  local step="$1"
  local total="$2"
  local label="$3"
  echo ""
  echo -e "${BOLD}${WHITE}[$step/$total]${RESET} ${BOLD}$label${RESET}"
  echo ""
}

# ── Gradient bar helper ──
_print_gradient_bar() {
  local animated="${1:-false}"
  local delay="${2:-0.015}"
  local bar_colors=("${CYAN}" "${CYAN}" "${BLUE}" "${BLUE}" "${MAGENTA}" "${MAGENTA}" "${BLUE}" "${BLUE}" "${CYAN}" "${CYAN}" "${BLUE}" "${BLUE}" "${MAGENTA}" "${MAGENTA}" "${BLUE}" "${BLUE}" "${CYAN}" "${CYAN}" "${BLUE}" "${BLUE}" "${MAGENTA}" "${MAGENTA}" "${BLUE}" "${BLUE}")
  echo -ne "  "
  for c in "${bar_colors[@]}"; do
    echo -ne "${c}██${RESET}"
    if [[ "$animated" == "true" ]]; then
      sleep "$delay"
    fi
  done
  echo ""
}

# ── Animated banner ──
print_banner() {
  echo ""

  # Top gradient bar — animated
  _print_gradient_bar true 0.012

  # Hexagon logo + title — draw line by line
  echo ""
  sleep 0.06
  echo -e "  ${CYAN}    ⬡${RESET}"
  sleep 0.06
  echo -e "  ${CYAN}   ⬡ ⬡${RESET}    ${BOLD}${WHITE}macOS Setup Config${RESET}"
  sleep 0.06
  echo -e "  ${BLUE}  ⬡   ⬡${RESET}   ${DIM}Your dev environment wizard${RESET}"
  sleep 0.06
  echo -e "  ${MAGENTA}   ⬡ ⬡${RESET}    ${DIM}── automated & interactive ──${RESET}"
  sleep 0.06
  echo -e "  ${MAGENTA}    ⬡${RESET}"
  sleep 0.1

  # Bottom gradient bar — animated
  echo ""
  _print_gradient_bar true 0.012
  echo ""
}

# ── Static banner (for non-interactive contexts) ──
print_banner_static() {
  echo ""
  _print_gradient_bar false
  echo ""
  echo -e "  ${CYAN}    ⬡${RESET}"
  echo -e "  ${CYAN}   ⬡ ⬡${RESET}    ${BOLD}${WHITE}macOS Setup Config${RESET}"
  echo -e "  ${BLUE}  ⬡   ⬡${RESET}   ${DIM}Your dev environment wizard${RESET}"
  echo -e "  ${MAGENTA}   ⬡ ⬡${RESET}    ${DIM}── automated & interactive ──${RESET}"
  echo -e "  ${MAGENTA}    ⬡${RESET}"
  echo ""
  _print_gradient_bar false
  echo ""
}
