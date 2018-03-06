#!/bin/bash
apt-get update
apt-get install -y python3
cd otus-homeworks/homeworks/packer-base
python3 -m unittest
