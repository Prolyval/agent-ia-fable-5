# Security Wallet Policy

Ce repo est public. Ne jamais y mettre:

- seed phrase;
- private key;
- bearer token;
- exchange API key;
- fichier `.env`;
- export complet Codex/Claude contenant historique ou secrets;
- screenshot affichant un wallet, une cle, un solde sensible ou une adresse privee.

## Avant trading reel

1. Utiliser un compte exchange separe du patrimoine principal.
2. Creer une API avec permissions minimales.
3. Desactiver tout droit de retrait.
4. Activer allowlist IP si possible.
5. Placer un plafond capital strict.
6. Commencer en paper trading ou sandbox.
7. Journaliser chaque decision: signal, entree, invalidation, stop, taille, resultat.

## Limites hard

- Pas de martingale.
- Pas de levier eleve.
- Pas de all-in.
- Pas de revenge trade.
- Pas d'ordre si donnees stale, contradictoires ou non verifiees.
- Stop quotidien si drawdown atteint.

## Passage en production

Le bot de recherche peut proposer des ordres. L'execution reelle doit rester derriere une couche separee:

- dry-run par defaut;
- simulation avant execution;
- confirmation humaine au debut;
- cle API sans retrait;
- logs immuables;
- kill switch.
