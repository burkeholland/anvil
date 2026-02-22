#!/bin/bash
set -e

REPO="burkeholland/anvil"
FILE=".github/agents/anvil.agent.md"
URL="https://raw.githubusercontent.com/$REPO/main/$FILE"

if [ "$1" = "global" ]; then
  DIR="$HOME/.copilot/agents"
  echo "Installing Anvil agent globally → $DIR"
else
  DIR=".copilot/agents"
  echo "Installing Anvil agent locally → $DIR"
fi

mkdir -p "$DIR"
curl -sL "$URL" -o "$DIR/anvil.agent.md"

echo "✅ Installed. Run 'copilot' and select the Anvil chat mode."
