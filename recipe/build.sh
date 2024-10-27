#!/usr/bin/env bash
set -e

if [ "$(uname)" == "Darwin" ]; then
  FIND_FRAMEWORK_NEVER="-DCMAKE_FIND_FRAMEWORK=NEVER"
  FIND_APPBUNDLE_NEVER="-DCMAKE_FIND_APPBUNDLE=NEVER"
fi

# Install Cycamore
#export VERBOSE=1
${PYTHON} install.py \
  --prefix=${PREFIX} \
  ${FIND_FRAMEWORK_NEVER} \
  ${FIND_APPBUNDLE_NEVER} \
  -DCMAKE_C_COMPILER=${GCC} \
  -DCMAKE_CXX_COMPILER=${CXX} \
  --allow-milps \
  -j "${CPU_COUNT}"
