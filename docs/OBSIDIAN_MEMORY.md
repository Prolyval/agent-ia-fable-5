# Obsidian Memory

Structure proposee pour synchroniser la memoire entre Fable/Claude, Codex et Obsidian.

```text
fable_trading_memory/
  README.md
  state.md
  decisions/
  research/
  backtests/
  trades-paper/
  trades-real/
  risks/
  sources/
```

## `state.md`

```markdown
---
updated: YYYY-MM-DD HH:mm
mode: research
capital_eur: 0
target_cycle_eur: 220
max_risk_per_trade_pct: 0.5
max_daily_loss_pct: 2
---

# State

## Current Objective
Atteindre un cycle net de +220 EUR apres validation papier et controle risque.

## Active Hypotheses
- H1:
- H2:

## Open Tasks
- [ ] Collect market data
- [ ] Filter suspicious assets
- [ ] Backtest candidate strategy
- [ ] Update dashboard

## Rules
- No real order without explicit production config.
- No trade if signal is weak or data is stale.
- Preserve capital first.
```

## Rituel de memoire

Au debut de session:
1. lire `state.md`;
2. lire les 3 derniers fichiers dans `decisions/`;
3. resumer ce qui a change depuis la derniere boucle.

A la fin de session:
1. creer une decision courte;
2. mettre a jour `state.md`;
3. ajouter les sources dans `sources/`;
4. lister les contradictions ou incertitudes.
