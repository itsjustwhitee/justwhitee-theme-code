#!/usr/bin/env bash
# justwhitee Dark — terminal color test
# Run: bash extras/test-colors.sh

RESET="\e[0m"
BOLD="\e[1m"
ITALIC="\e[3m"
DIM="\e[2m"

# ── header ──────────────────────────────────────────────────────────────────
echo ""
printf "${BOLD}\e[38;5;6m  justwhitee Dark — terminal palette test${RESET}\n"
printf "${DIM}  If colors look wrong, set the palette first (see README).${RESET}\n"
echo ""

# ── 16-color named swatches ──────────────────────────────────────────────────
declare -a NAMES=(
  "black   #182424  (dark bg)"
  "red     #CC4848  (errors / return)"
  "green   #72C85A  (strings / ok)"
  "yellow  #D4B45A  (functions)"
  "blue    #3A9890  (keywords / accent)"
  "magenta #8878D8  (import / module kw)"
  "cyan    #56B0A8  (declarations)"
  "white   #DBD8C6  (main text)"
  "brBlack #324444  (comments)"
  "brRed   #E85050  (bright errors)"
  "brGreen #8ED870  (bright strings)"
  "brYellow#E4CC60  (constants)"
  "brBlue  #56B0A8  (bright accent)"
  "brMag   #C898D0  (decorators)"
  "brCyan  #74C4BC  (type params)"
  "brWhite #ECE8D8  (bold text)"
)

printf "  ${BOLD}Foreground colors${RESET}\n"
for i in "${!NAMES[@]}"; do
  printf "  \e[$(( i < 8 ? 30+i : 90+i-8 ))m%-38s${RESET}" "${NAMES[$i]}"
  if (( (i+1) % 2 == 0 )); then echo; fi
done
echo ""
echo ""

printf "  ${BOLD}Background swatches${RESET}\n"
printf "  "
for i in $(seq 0 7); do
  printf "\e[$(( 40+i ))m  %2d  ${RESET}" "$i"
done
echo ""
printf "  "
for i in $(seq 8 15); do
  printf "\e[$(( 100+i-8 ))m  %2d  ${RESET}" "$i"
done
echo ""
echo ""

# ── text style samples ───────────────────────────────────────────────────────
printf "  ${BOLD}Text styles${RESET}\n"
printf "  \e[32mNormal string text\n${RESET}"
printf "  \e[1;32mBold string text\n${RESET}"
printf "  \e[3;32mItalic string text (comments, builtins)\n${RESET}"
printf "  \e[4;36mUnderline / links\n${RESET}"
printf "  \e[1;33mBold function name\n${RESET}"
printf "  \e[34mKeyword / control flow\n${RESET}"
printf "  \e[31mError / return / raise\n${RESET}"
printf "  \e[35mImport keyword\n${RESET}"
printf "  \e[90mComment text (dim)\n${RESET}"
echo ""

# ── realistic code sample ────────────────────────────────────────────────────
printf "  ${BOLD}Simulated code snippet${RESET}\n"
echo ""
printf "  \e[35mimport\e[0m \e[96mnumpy\e[0m \e[35mas\e[0m \e[96mnp\e[0m\n"
printf "  \e[35mfrom\e[0m \e[96mtyping\e[0m \e[35mimport\e[0m \e[96mList\e[0m\n"
echo ""
printf "  \e[90m# compute weighted average\e[0m\n"
printf "  \e[34mclass\e[0m \e[91mWeightedMean\e[0m:\n"
printf "      \e[34mdef\e[0m \e[33m__init__\e[0m(\e[0mself\e[0m, \e[37mweights\e[0m: \e[96mList\e[0m[\e[96mfloat\e[0m]) -> \e[96mNone\e[0m:\n"
printf "          \e[0mself.weights\e[0m = \e[32mnp.array\e[0m(\e[37mweights\e[0m)\n"
echo ""
printf "      \e[34mdef\e[0m \e[33mcompute\e[0m(\e[0mself\e[0m, \e[37mvalues\e[0m: \e[96mList\e[0m[\e[96mfloat\e[0m]) -> \e[96mfloat\e[0m:\n"
printf "          \e[31mreturn\e[0m \e[32mnp.dot\e[0m(\e[0mself.weights\e[0m, \e[37mvalues\e[0m) / \e[35msum\e[0m(\e[0mself.weights\e[0m)\n"
echo ""

# ── 256-color gradient (extra) ───────────────────────────────────────────────
printf "  ${BOLD}256-color gradient (terminal capability check)${RESET}\n"
printf "  "
for i in $(seq 0 35); do
  printf "\e[48;5;$(( 16 + i ))m  ${RESET}"
done
echo ""
printf "  "
for i in $(seq 36 71); do
  printf "\e[48;5;$(( 16 + i ))m  ${RESET}"
done
echo ""
echo ""
