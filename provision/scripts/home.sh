#!/bin/bash
set -e

DIR=$( cd $( dirname "${BASH_SOURCE[0]}" ) && pwd )


cd ~
git clone https://github.com/tyurind/dotfiles.git .dotfiles