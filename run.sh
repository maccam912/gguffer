#!/bin/bash

set -ex

pushd llama.cpp
make quantize -j
popd
/root/.pixi/bin/pixi run python ./quantizeHFmodel/quantizeHFmodel.py $1
