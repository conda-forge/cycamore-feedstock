#!/usr/bin/env bash
set -e

# Install Cycamore
#export VERBOSE=1
${PYTHON} install.py \
  --prefix=${PREFIX} \
  ${CMAKE_ARGS} \
  -DCMAKE_C_COMPILER=${GCC} \
  -DCMAKE_CXX_COMPILER=${CXX} \
  --allow-milps \
  -j "${CPU_COUNT}"
