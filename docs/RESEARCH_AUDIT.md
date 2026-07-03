# Research Audit - 2026-07-03

Statut: recherche et simulation. Pas de conseil financier. Pas d'execution reelle.

## Snapshot marche

Source: CoinGecko markets API, EUR, trie par volume, recupere le 2026-07-03 vers 14:36 Europe/Paris.

Actifs liquides observes:

| Actif | Prix EUR | 24h | 7j | Volume 24h | Note |
|---|---:|---:|---:|---:|---|
| BTC | 54033 | +0.89% | +3.81% | 28.4B | base liquidite |
| ETH | 1513.2 | +4.50% | +11.76% | 10.6B | momentum positif |
| SOL | 70.97 | -0.38% | +18.16% | 2.31B | fort 7j, attendre setup |
| XRP | 0.964 | +1.08% | +7.69% | 1.37B | liquidite OK |
| BNB | 492.96 | +0.69% | +0.57% | 580M | range calme |
| ADA | 0.147 | +4.80% | +16.86% | 462M | momentum mais volatil |
| HYPE | 60.2 | +5.66% | +10.54% | 443M | momentum + risque specifique |
| TRX | 0.279 | +1.06% | -0.94% | 359M | faible momentum |
| ZEC | 397.95 | +1.97% | +14.42% | 300M | volatil |
| UNI | 2.82 | +3.34% | +12.15% | 270M | liquidite moyenne |
| SUI | 0.655 | +1.26% | +10.67% | 249M | liquidite moyenne |

Signaux "eviter jusqu'a verification manuelle":

- `sheboshis-2`: volume affiche tres eleve avec market cap minuscule et donnees stale.
- `quq`: volume/market-cap anormalement eleve.
- `nesa`: volume tres eleve vs market cap, spike fort.
- `alien-worlds`: hausse 7j extreme et rang plus faible.
- Tout actif avec prix null, update stale, volume artificiel ou market cap rank tres faible.

## Depots GitHub audites

Donnees via GitHub API le 2026-07-03.

| Depot | Role | Stars | Push recent | Risque scam | Verdict |
|---|---|---:|---|---|---|
| ccxt/ccxt | connecteurs exchanges | 43165 | 2026-07-03 | faible | brique solide pour data/execution API |
| freqtrade/freqtrade | bot crypto + backtest + dry-run | 52019 | 2026-07-02 | faible | meilleur point de depart execution prudente |
| hummingbot/hummingbot | market making/arbitrage | 19059 | 2026-07-02 | faible a moyen | puissant mais plus complexe |
| hummingbot/hummingbot-api | orchestration bots | 130 | 2026-07-02 | moyen | utile apres maitrise, surface de securite plus large |
| polakowo/vectorbt | backtesting vectorise | 8128 | 2026-06-29 | faible | excellent pour recherche rapide |
| kernc/backtesting.py | backtesting Python | 8624 | 2025-12-20 | faible | simple, licences a verifier selon usage |
| bmoscon/cryptofeed | websocket market data | 2866 | 2026-02-01 | faible a moyen | utile data temps reel, maintenance correcte |
| jesse-ai/jesse | framework trading crypto | 8133 | 2026-07-02 | moyen | interessant mais a isoler avant production |
| python-telegram-bot/python-telegram-bot | alertes Telegram | 29280 | 2026-07-01 | faible | bon pour notifications |
| binance/binance-connector-python | connecteur Binance | 2879 | 2026-06-30 | faible technique, risque exchange | officiel mais exchange-specific |
| TA-Lib/ta-lib-python | indicateurs techniques | 12090 | 2026-06-22 | faible | brique classique |

## Stack conseillee

Phase 1 - Recherche:

- CoinGecko / exchange public APIs pour scan.
- vectorbt ou backtesting.py pour valider les idees.
- Dashboard local pour lecture et journal.

Phase 2 - Paper trading:

- Freqtrade en dry-run.
- Strategie simple, capital virtuel, logs.
- Telegram uniquement pour alertes, pas pour signaux aveugles.

Phase 3 - Production limitee:

- API exchange sans retrait.
- Taille minuscule.
- Kill switch.
- Journal obligatoire.

## Checklist anti-scam depot trading

Marquer rouge si:

- promet profit garanti;
- demande seed phrase/private key;
- demande API avec droits de retrait;
- binaire obfusque ou code ferme;
- pas de licence, pas de tests, pas de documentation;
- Telegram/Discord obligatoire pour fonctionner;
- screenshots de gains sans backtests reproductibles;
- strategie cachee;
- beaucoup de forks suspects, peu d'activite reelle;
- dependances inconnues qui touchent aux wallets.
