#!/usr/bin/env bash
# justwhitee Dark — GNOME Terminal profile installer
# Run with: bash gnome-terminal-install.sh

set -e

PROFILE_NAME="justwhitee Dark"
PROFILE_ID=$(uuidgen)
DCONF_PATH="/org/gnome/terminal/legacy/profiles:/:${PROFILE_ID}"

dconf write "${DCONF_PATH}/visible-name"        "'${PROFILE_NAME}'"
dconf write "${DCONF_PATH}/use-theme-colors"    "false"
dconf write "${DCONF_PATH}/use-theme-transparency" "false"
dconf write "${DCONF_PATH}/use-transparent-background" "false"

# Background & foreground
dconf write "${DCONF_PATH}/background-color"    "'#090d0d'"
dconf write "${DCONF_PATH}/foreground-color"    "'#dbd8c6'"
dconf write "${DCONF_PATH}/bold-color"          "'#ece8d8'"
dconf write "${DCONF_PATH}/bold-color-same-as-fg" "false"
dconf write "${DCONF_PATH}/cursor-colors-set"   "true"
dconf write "${DCONF_PATH}/cursor-background-color" "'#3a9890'"
dconf write "${DCONF_PATH}/cursor-foreground-color" "'#090d0d'"

# 16-color ANSI palette
# Order: black red green yellow blue magenta cyan white (normal then bright)
dconf write "${DCONF_PATH}/palette" "[
  '#182424',
  '#cc4848',
  '#72c85a',
  '#d4b45a',
  '#3a9890',
  '#8878d8',
  '#56b0a8',
  '#dbd8c6',
  '#324444',
  '#e85050',
  '#8ed870',
  '#e4cc60',
  '#56b0a8',
  '#c898d0',
  '#74c4bc',
  '#ece8d8'
]"

# Register the new profile in the list of known profiles
EXISTING=$(dconf read /org/gnome/terminal/legacy/profiles:/list | tr -d "[]'" | tr ',' '\n' | grep -v "^$" | xargs)
if [ -z "$EXISTING" ]; then
  dconf write /org/gnome/terminal/legacy/profiles:/list "['${PROFILE_ID}']"
else
  dconf write /org/gnome/terminal/legacy/profiles:/list "['$(echo $EXISTING | sed "s/ /', '/g")', '${PROFILE_ID}']"
fi

echo "✔ Profile '${PROFILE_NAME}' installed (ID: ${PROFILE_ID})"
echo "  Open GNOME Terminal → Preferences → Profiles and set it as default."
