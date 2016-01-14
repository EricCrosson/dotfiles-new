#!/usr/bin/env bash

if [[ -z $(which pacapt) ]]; then
    sudo wget -O /usr/local/bin/pacapt https://github.com/icy/pacapt/raw/ng/pacapt
    sudo chmod 755 /usr/local/bin/pacapt
fi

sudo ln -sv /usr/local/bin/pacapt /usr/local/bin/pacman || true
sudo ln -sv /usr/local/bin/pacapt /usr/local/bin/yaourt || true
