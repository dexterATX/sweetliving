#!/usr/bin/env bash
#
# install-skills.sh — make this bundle's skills the DEFAULT for every repo.
#
# It copies each skill in ./skills/ into your user-level Claude skills
# directory (~/.claude/skills). Skills placed there load in *every* Claude Code
# session, regardless of which repository you're in.
#
# Usage:
#   bash ./.claude/install-skills.sh                        # install to ~/.claude/skills
#   CLAUDE_SKILLS_DIR=/custom bash ./.claude/install-skills.sh
#
# Re-running is safe; it overwrites previously installed copies of these skills.

set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/skills" && pwd)"
DEST_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

if [ ! -d "$SRC_DIR" ]; then
  echo "error: no skills/ directory found next to this script" >&2
  exit 1
fi

mkdir -p "$DEST_DIR"
echo "Installing skills"
echo "  from: $SRC_DIR"
echo "  to:   $DEST_DIR"
echo

count=0
for skill in "$SRC_DIR"/*/; do
  [ -f "${skill}SKILL.md" ] || continue
  name="$(basename "$skill")"
  rm -rf "${DEST_DIR:?}/${name}"
  cp -R "$skill" "$DEST_DIR/$name"
  echo "  ✓ $name"
  count=$((count + 1))
done

echo
if [ "$count" -eq 0 ]; then
  echo "No skills found to install." >&2
  exit 1
fi
echo "Installed $count skill(s) to $DEST_DIR"
echo "Restart Claude Code (or start a new session) to load them."
