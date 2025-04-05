#!/bin/bash

create_venv() {
    VENV_DIR=".venv"
    echo "Creating a virtual environment in directory $VENV_DIR..."
    $PYTHON_BIN -m venv "$VENV_DIR"
    source "$VENV_DIR/bin/activate"
    echo "Upgrading pip..."
    pip install --upgrade pip
    echo "Installing dependencies..."
    pip install -r requirements.txt
    export PYTHON_BIN="$VENV_DIR/bin/python"
    function deactivate_venv {
        echo "Deactivating the virtual environment..."
        deactivate
    }
    trap deactivate_venv EXIT HUP
    echo "Virtual environment is active. Use 'deactivate' to exit."
    exec "$SHELL"
}

OS_TYPE=$(uname)

if [[ "$OS_TYPE" == "Darwin" ]]; then
    echo "Detected macOS"
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is not installed. Please install Homebrew first."
        exit 1
    fi
    PYTHON_BIN=$(brew --prefix)/bin/python3.10
    if [ ! -f "$PYTHON_BIN" ]; then
        echo "Python 3.10 is not installed via Homebrew. Please install Python 3.10 with Homebrew using: brew install python@3.10"
        exit 1
    fi
    create_venv

elif [[ "$OS_TYPE" == "Linux" ]]; then
    echo "Detected Linux"
    if ! command -v python3.10 &> /dev/null; then
        echo "Python 3.10 is not installed. Please install Python 3.10 on your Linux system."
        exit 1
    fi
    PYTHON_BIN=$(command -v python3.10)
    create_venv

else
    echo "Unsupported operating system: $OS_TYPE"
    exit 1
fi