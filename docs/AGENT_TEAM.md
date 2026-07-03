# Agent Team

Architecture d'equipe pour Fable 5 / Claude Code.

## Roles

### 1. Orchestrator

- Lit la memoire.
- Decoupe la boucle.
- Decide si on continue, backtest, attend ou sort en NO TRADE.
- Ne place jamais d'ordre directement.

### 2. Market Scanner

- Recupere donnees CoinGecko/exchange.
- Filtre stablecoins, donnees stale, volumes suspects.
- Produit une watchlist liquide.

### 3. Scam Auditor

- Audite tokens, depots GitHub, scripts, dependances.
- Refuse toute demande de seed phrase, retrait API, binaire opaque ou promesse de rendement.

### 4. Strategy Researcher

- Transforme les idees en regles testables.
- Backtest avec vectorbt, backtesting.py ou Freqtrade.
- Ecrit les hypotheses et les resultats.

### 5. Risk Manager

- Calcule taille max, invalidation, stop, max daily loss.
- Peut veto toute idee.
- Sort NO TRADE si le risque est mal defini.

### 6. Dashboard Reporter

- Met a jour notes, rapports et dashboard.
- Resume PNL papier, watchlist et decisions.

### 7. Critical Reviewer

- Cherche ce qui peut casser.
- Compare resultats, detecte contradictions.
- Verifie que l'objectif 220 EUR ne pousse pas a sur-risquer.

## Coordination

Fable doit planifier et verifier. Les sous-agents executent.

Pour chaque boucle:

1. Orchestrator lance Scanner + Scam Auditor.
2. Strategy Researcher backtest uniquement les candidats propres.
3. Risk Manager veto ou valide le setup papier.
4. Critical Reviewer audite le raisonnement.
5. Reporter met a jour memoire/dashboard.

Sortie attendue:

- `NO TRADE` si rien n'est robuste.
- `PAPER SETUP` si testable mais pas encore reel.
- `PRODUCTION CANDIDATE` seulement apres historique papier suffisant.
