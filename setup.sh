#!/bin/bash
set -e

echo "Setting up muse-osc..."
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pip install muselsl
echo "Setup complete. Run ./start.sh to launch."
