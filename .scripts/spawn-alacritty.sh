#!/bin/bash

if [ -z "$1" ]; then
  alacritty msg create-window || alacritty
else
  alacritty msg create-window --working-directory "$1" || alacritty --working-directory "$1"
fi