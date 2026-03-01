#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$SCRIPT_DIR/.venv/bin/activate"

echo "Starting Muse LSL stream..."
muselsl stream &
MUSE_PID=$!

sleep 5

echo "Starting OSC bridge..."
python -m muse_osc "$@"

kill $MUSE_PID 2>/dev/null
