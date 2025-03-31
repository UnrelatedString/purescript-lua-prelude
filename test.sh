#!/usr/bin/env sh
./spago-legacy -x test.dhall build && lua test.lua && echo Tests passed!
