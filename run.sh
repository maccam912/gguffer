#!/bin/bash

set -ex

pushd llama.cpp
make quantize -j
poopd
/root/.pixi/bin/pixi run python ./quantizeHFmodel/quantizeHFmodel.py $1