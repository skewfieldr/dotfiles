#!/bin/bash

# Set variables
VENV_DIR=".config/polybar/spotify/.venv"  # Path to your virtual environment directory
PYTHON_SCRIPT=".config/polybar/spotify/polybar-spotify.py"
# Path to your Python script

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Run the Python script
python3 "$PYTHON_SCRIPT" -f '{artist} - {song}'

# Deactivate the virtual environment (optional)
deactivate
