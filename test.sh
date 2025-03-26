#!/usr/bin/env sh
./spago-legacy -x test.dhall build && lua output/test.lua
