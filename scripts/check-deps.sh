#!/usr/bin/env bash
# Checks preconditions for agentic.nvim backends.
# Mandatory: Claude ACP (node, npm, claude logged in, claude-agent-acp).
# Extras: omp (Oh My Pi) — reported but not required.
# Exits 0 if all mandatory checks pass, 1 otherwise.
set -eu

# --- Colors (disabled when not a TTY, e.g. piped) ---
if [ -t 1 ]; then
  bold=$'\033[1m'; green=$'\033[32m'; red=$'\033[31m'; yellow=$'\033[33m'; cyan=$'\033[36m'; dim=$'\033[2m'; reset=$'\033[0m'
else
  bold=""; green=""; red=""; yellow=""; cyan=""; dim=""; reset=""
fi

ok()   { printf "  ${green}✓${reset}  %s\n" "$1"; }
bad()  { printf "  ${red}✗${reset}  %s\n" "$1"; }
info() { printf "  ${yellow}·${reset}  %s\n" "$1"; }
hdr()  { printf "\n${bold}${cyan}── %s ──${reset}\n" "$1"; }

contains() {
  local needle="$1"; shift
  for x in "$@"; do [ "$x" = "$needle" ] && return 0; done
  return 1
}

missing=()         # mandatory items not satisfied
extras_missing=()  # optional items not found

# Mandatory: node, npm, claude (logged in), claude-agent-acp.
check_mandatory() {
  if command -v node >/dev/null 2>&1; then
    ok "node $(node --version 2>/dev/null)"
  else
    bad "node — not found"
    missing+=(node)
  fi

  if command -v npm >/dev/null 2>&1; then
    ok "npm $(npm --version 2>/dev/null)"
  else
    bad "npm — not found (ships with node)"
    missing+=(npm)
  fi

  # claude CLI must be present and logged in for the adapter to reach the API.
  if command -v claude >/dev/null 2>&1; then
    if claude auth status 2>/dev/null | grep -q '"loggedIn": *true'; then
      ok "claude CLI (logged in)"
    else
      bad "claude CLI — not logged in"
      missing+=(claude)
    fi
  else
    bad "claude CLI — not found (needed for auth)"
    missing+=(claude)
  fi

  # The adapter agentic.nvim spawns.
  if command -v claude-agent-acp >/dev/null 2>&1; then
    ok "claude-agent-acp"
  else
    bad "claude-agent-acp — not found"
    missing+=(claude-agent-acp)
  fi
}

# Extras: omp (Oh My Pi). Missing is informational, not a failure.
check_extras() {
  if command -v omp >/dev/null 2>&1; then
    ok "omp (Oh My Pi) — extra backend available"
  else
    info "omp (Oh My Pi) — not installed (optional; enables the Pi provider in \\s switcher)"
    extras_missing+=(omp)
  fi
}

print_install_steps() {
  hdr "Install steps (mandatory)"

  if contains node "${missing[@]}"; then
    printf "  ${cyan}node${reset} — install from your distro or https://nodejs.org\n"
  fi
  if contains npm "${missing[@]}"; then
    printf "  ${cyan}npm${reset} — ships with node; reinstall node if absent\n"
  fi
  if contains claude "${missing[@]}"; then
    printf "  ${cyan}claude${reset} — Claude Code CLI (install if missing, then log in)\n"
    printf "    install: https://docs.claude.com/en/docs/claude-code/setup\n"
    printf "    login:   ${bold}claude /login${reset}\n"
  fi
  if contains claude-agent-acp "${missing[@]}"; then
    printf "  ${cyan}claude-agent-acp${reset} — the ACP adapter agentic.nvim spawns\n"
    printf "    ${bold}npm i -g --prefix ~/.local @agentclientprotocol/claude-agent-acp${reset}\n"
    printf "    --prefix ~/.local avoids sudo; ensure ${bold}~/.local/bin${reset} is on \$PATH\n"
  fi

  if [ ${#extras_missing[@]} -gt 0 ]; then
    hdr "Optional"
    if contains omp "${extras_missing[@]}"; then
      printf "  ${cyan}omp${reset} — Oh My Pi (optional backend)\n"
      printf "    install: ${bold}curl -fsSL https://omp.sh/install | sh${reset}\n"
    fi
  fi
}

main() {
  hdr "Mandatory: Claude ACP backend"
  check_mandatory

  hdr "Extras"
  check_extras

  if [ ${#missing[@]} -eq 0 ]; then
    printf "\n${green}${bold}All mandatory preconditions met.${reset}"
    if [ ${#extras_missing[@]} -gt 0 ]; then
      printf " ${dim}(optional: %s)${reset}" "${extras_missing[*]}"
    fi
    printf "\n\n"
    exit 0
  fi

  printf "\n${yellow}${bold}Missing:${reset} %s\n" "${missing[*]}"
  print_install_steps
  printf "\n"
  exit 1
}

main "$@"
