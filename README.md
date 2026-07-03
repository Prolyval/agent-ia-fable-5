# agent-ia-fable-5

Pack public et safe pour piloter Fable 5 / Claude Code en mode research desk crypto.

Objectif operationnel:
- construire un agent autonome de recherche, backtest, surveillance et reporting;
- viser des cycles de +220 EUR uniquement apres validation papier/backtest;
- financer les abonnements IA avec des gains verifies, sans promesse de performance;
- garder une memoire markdown compatible Obsidian;
- ne jamais exposer seed phrase, private key, token, ou droits de retrait.

## Contenu

- `index.html` - dashboard local: marche crypto dynamique, score de watchlist, positions simulees, objectif 220 EUR.
- `prompts/FABLE5_CRYPTO_RESEARCH_LOOP.md` - prompt court pour lancer Fable/Claude sur VPS en boucle.
- `docs/RESEARCH_AUDIT.md` - audit marche + depots GitHub utiles + signaux scam.
- `docs/SECURITY_WALLET_POLICY.md` - regles avant tout passage en argent reel.
- `docs/OBSIDIAN_MEMORY.md` - structure memoire locale compatible Obsidian.

## Utilisation rapide

Ouvre `index.html` dans un navigateur.

Le dashboard essaie de charger CoinGecko en direct. Si l'API est indisponible, il utilise le snapshot embarque.

## Regle de securite

Recherche d'abord. Paper trading ensuite. Argent reel seulement apres backtests, limites de risque, API sans retrait, et validation humaine explicite.
