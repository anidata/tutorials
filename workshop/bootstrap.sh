#!/bin/sh
set -e 

git clone https://github.com/anidata/tutorials ${HOME}/work

exec start-notebook.sh --NotebookApp.token='tutorials'
