#!/usr/bin/env bash

go test -timeout 30s -count 1 -v -run ^"$1"$

