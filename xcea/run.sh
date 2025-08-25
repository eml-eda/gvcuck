#!/bin/bash

#####################################################################
# This script is used to run the gvsoc simulator with a test binary #
#####################################################################

GVSOC_DIR=".."
APP_DIR="./examples/pulp-open/"
VENV_DIR="./.venv/"

APP_NAME="hello"
TARGET=pulp-open
GVSOC_FLAGS="--trace=insn:traces.log --trace-level=DEBUG"

# Activate the GVSoC venv
cd $GVSOC_DIR && \
source "${VENV_DIR}bin/activate" && \

# Build the GVSoC target
echo "Building GVSoC target..." && \
source ./sourceme.sh && \
#make clean
make TARGETS=$TARGET build && \

# Run GVSoC
echo "Running GVSoC..." && \
gvsoc --target=$TARGET $GVSOC_FLAGS --binary $APP_DIR/$APP_NAME run
