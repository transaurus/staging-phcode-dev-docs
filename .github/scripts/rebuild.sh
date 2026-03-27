#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for phcode-dev/docs
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
# Docusaurus 3.7.0 requires Node 20+
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck source=/dev/null
    . "$NVM_DIR/nvm.sh"
    nvm use 20 || nvm install 20
fi

echo "[INFO] Node version: $(node -v)"
echo "[INFO] NPM version: $(npm -v)"

# --- Package manager + dependencies ---
# Uses npm (package-lock.json exists)
npm ci

# --- Build ---
npm run build

echo "[DONE] Build complete."
