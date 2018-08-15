#!/bin/sh

if [ ! -f ${HOME}/bin/bats ]; then
        git clone https://github.com/bats-core/bats-core.git \
                ${HOME}/bats-core
        OLD_DIR=$(pwd)
        cd ${HOME}/bats-core
        ./install.sh ${HOME}/bats
        cd ${OLD_DIR}
fi
