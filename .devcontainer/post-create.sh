#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

git config --local core.checkStat minimal

# SKIP: Install beads (curl fails due to SSL)
# curl -fsSL https://raw.githubusercontent.com/steveyegge/beads/main/scripts/install.sh | bash

# SKIP: Bootstrap beads (requires bd binary)
# bd bootstrap

# SKIP: Install Claude Code (curl fails)
# curl -fsSL https://claude.ai/install.sh | bash

# Install PostgreSQL client
sudo apt-get update -qq && sudo apt-get install -y --no-install-recommends postgresql-client-17

# Project-specific tools
npm install
npx playwright install-deps chromium
npx playwright install chromium
"$SCRIPT_DIR/install-nsjail.sh"

# SKIP: gitleaks, supabase, lefthook (all require curl or external tools)

echo "post-create.sh completed with limited setup (some tools skipped due to network issues)"
