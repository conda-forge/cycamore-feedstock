#!/usr/bin/env bash
set -e

if [ "$(uname)" == "Darwin" ]; then
  # other
  libext=".dylib"
  export LDFLAGS="-rpath ${PREFIX}/lib ${LDFLAGS}"
  export LINKFLAGS="${LDFLAGS}"
  skiprpath="-DCMAKE_SKIP_RPATH=TRUE"
else
  libext=".so"
  skiprpath=""
fi

# Install Cycamore
#export VERBOSE=1
${PYTHON} install.py \
  --prefix=${PREFIX} \
  -DCMAKE_C_COMPILER=${GCC} \
  -DCMAKE_CXX_COMPILER=${CXX} \
  --allow-milps \
  -j "${CPU_COUNT}"
