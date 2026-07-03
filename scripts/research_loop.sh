#!/usr/bin/env bash
set -euo pipefail

CLAUDE_BIN="${CLAUDE_BIN:-claude}"
INTERVAL_SECONDS="${INTERVAL_SECONDS:-1800}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MEMORY_DIR="$ROOT_DIR/fable_trading_memory"
LOG_DIR="$ROOT_DIR/logs"

mkdir -p \
  "$MEMORY_DIR/decisions" \
  "$MEMORY_DIR/research" \
  "$MEMORY_DIR/backtests" \
  "$MEMORY_DIR/sources" \
  "$MEMORY_DIR/risks" \
  "$MEMORY_DIR/trades-paper" \
  "$MEMORY_DIR/trades-real" \
  "$LOG_DIR"

if [ ! -f "$MEMORY_DIR/state.md" ]; then
  cat > "$MEMORY_DIR/state.md" <<'STATE'
---
mode: research
capital_eur: 0
target_cycle_eur: 220
max_risk_per_trade_pct: 0.5
max_daily_loss_pct: 2
updated: pending
---

# State

## Current Objective

Find realistic, risk-controlled paths toward repeated +220 EUR net cycles.

## Rules

- Research and paper trading only.
- No real order without explicit production config.
- No seed phrase, private key, wallet export, or withdrawal permission.
- NO TRADE when data is stale, contradictory, or weak.
STATE
fi

PROMPT_FILE="$ROOT_DIR/prompts/FABLE5_CRYPTO_RESEARCH_LOOP.md"

if ! command -v "$CLAUDE_BIN" >/dev/null 2>&1; then
  echo "Claude/Fable CLI not found: $CLAUDE_BIN"
  echo "Set CLAUDE_BIN to your installed command, for example:"
  echo "export CLAUDE_BIN=claude"
  exit 1
fi

echo "Starting Fable 5 research loop"
echo "Root: $ROOT_DIR"
echo "Memory: $MEMORY_DIR"
echo "Interval: ${INTERVAL_SECONDS}s"
echo "Mode: research/paper only"

while true; do
  TS="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  LOG_FILE="$LOG_DIR/fable-loop-$(date -u +"%Y-%m-%d").log"

  {
    echo ""
    echo "===== LOOP $TS ====="
    "$CLAUDE_BIN" "Read $PROMPT_FILE and execute exactly one full research loop. Use $MEMORY_DIR as durable memory. Do not place real orders. End with NO TRADE, PAPER SETUP, or RESEARCH UPDATE."
    echo "===== END $TS ====="
  } 2>&1 | tee -a "$LOG_FILE"

  sleep "$INTERVAL_SECONDS"
done
