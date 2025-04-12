#!/usr/bin/env bash

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

  go test "${test_args[@]}"
}

gotest "$@"
