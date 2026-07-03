# VPS Continuous Run

Objectif: faire travailler Fable/Claude en boucle sur le VPS sans execution reelle.

## Installation

```bash
git clone https://github.com/Prolyval/agent-ia-fable-5.git
cd agent-ia-fable-5
chmod +x scripts/research_loop.sh
```

## Lancer avec tmux

```bash
tmux new -s fable5
./scripts/research_loop.sh
```

Detacher:

```text
Ctrl+B puis D
```

Reprendre:

```bash
tmux attach -t fable5
```

## Variables utiles

```bash
export CLAUDE_BIN=claude
export INTERVAL_SECONDS=1800
./scripts/research_loop.sh
```

Si ton CLI Claude/Fable utilise une autre commande, change `CLAUDE_BIN`.

## Logs

Les logs vont dans:

```text
logs/fable-loop-YYYY-MM-DD.log
```

La memoire va dans:

```text
fable_trading_memory/
```

## Production interdite par defaut

Le script ne configure aucun wallet et aucune API exchange.

Pour passer en reel plus tard, il faudra une couche separee:

- API exchange sans retrait;
- IP allowlist;
- capital plafonne;
- dry-run d'abord;
- kill switch;
- confirmation humaine.

## Premier objectif raisonnable

1. 24h de boucles research.
2. 20 signaux papier minimum.
3. Rapport win/loss, drawdown, slippage theorique.
4. Passage a micro capital uniquement si le systeme survit au papier.
