#!/bin/bash

set -ex
printf "\nsource ~/.bashrc.1\n" >>~/.bashrc

pip3.10 install python-dotenv pyyaml psutil psycopg2-binary pre-commit isort pylama pyflakes==2.4.0
pip3.10 install pyspark-test --no-deps

echo 'Finished setup!'
