#!/bin/bash
set -e

echo Welcome to Claudette!

# Try to update Claude Code to the latest version
if ! claude update 2>&1; then
    echo "Update failed - running claude install to initialize metadata..."
    claude install
    echo "Retrying update..."
    claude update
fi

# Execute the command passed to docker run, or default CMD
exec "$@"
