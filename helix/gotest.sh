#!/usr/bin/env bash

color_end="\033[0m"
color_orange="\033[1;38;5;208m"
color_green="\033[1;32m"
color_cyan="\033[1;36m"

trap cleanup SIGINT

runtest() {
  local func_name=${1// /} # remove space
  local -a formatter
  IFS=' ' read -ra formatter <<<"$2"

  local test_args=(
    -json
    -timeout 10s
    -count 1
  )

  if [ -n "$func_name" ]; then
    test_args+=(-run ^"$func_name"\$)
  fi

  echo -e "${color_green}❯ go test${color_end}""${color_cyan}" "${test_args[@]}" "${color_end}""|""${color_green}" "${formatter[@]}" "${color_end}"
  go test "${test_args[@]}" | "${formatter[@]}"
}

cleanup() {
  zellij action toggle-floating-panes
  exit
}

runtest "$@"

echo -e "\n\n${color_green}Help: <${color_end}${color_orange}ENTER${color_end}${color_green}> re-run, <${color_end}${color_orange}Ctrl-c${color_end}${color_green}> exit${color_end}\n"

while read -rs; do
  case $REPLY in
  *)
    runtest "$@"
    echo -e "\n\n${color_green}Help: <${color_end}${color_orange}ENTER${color_end}${color_green}> re-run, <${color_end}${color_orange}Ctrl-c${color_end}${color_green}> exit${color_end}\n"
    ;;
  esac
done
