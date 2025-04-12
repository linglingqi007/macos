#!/usr/bin/env bash

color_end="\033[0m"
color_orange="\033[1;38;5;208m"
color_yellow="\033[1;32m"
color_green="\033[1;36m"

trap cleanup SIGINT

gotest() {
  local func_name=${1// /} # remove space
  local test_args=(
    -v
    -timeout 10s
    -count 1
  )

  if [ -n "$func_name" ]; then
    test_args+=(-run ^"$func_name"\$)
  fi

  echo -e "${color_yellow}❯ go${color_end} test""${color_green}" "${test_args[@]}" "${color_end}"
  go test "${test_args[@]}"
}

cleanup() {
  zellij action toggle-floating-panes
  exit
}

gotest "$@"

echo -e "\n\n${color_yellow}Help: <${color_end}${color_orange}ENTER${color_end}${color_yellow}> re-run, <${color_end}${color_orange}Ctrl-c${color_end}${color_yellow}> exit${color_end}\n"

while read -r; do
  case $REPLY in
  *)
    gotest "$@"
    echo -e "\n\n${color_yellow}Help: <${color_end}${color_orange}ENTER${color_end}${color_yellow}> re-run, <${color_end}${color_orange}Ctrl-c${color_end}${color_yellow}> exit${color_end}\n"
    ;;
  esac
done
