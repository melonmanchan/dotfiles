#!/usr/bin/env bash
set -e

sudo apt-get purge -y tmux
sudo apt-get install -y libevent-dev

wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
tar -xzf tmux-2.3.tar.gz
cd tmux-2.3
./configure
./make
sudo mv ./tmux /usr/bin
cd ..

rm -r tmux-2.3
rm tmux-2.3.tar.gz
