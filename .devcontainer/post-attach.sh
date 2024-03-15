#!/bin/bash

set -ex

git config --list | grep "safe.directory=$(pwd)" || git config --global --add safe.directory $(pwd)

echo "Who am I?" && whoami

~/spark/sbin/start-history-server.sh || echo "Spark history server already running!"
