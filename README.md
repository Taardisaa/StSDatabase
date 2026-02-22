# Slay the Spire Database (stsdb)

A card/relic query toolset for [Slay the Spire](https://www.megacrit.com/).

It exposes two main commands:

- `query_card`: query card metadata, with optional upgrade level.
- `query_relic`: query relic metadata.

Both commands use exact name matching only (no fuzzy match, no partial match, no fallback).

`query_card` also supports `upgrade_times`:

- Most cards: capped at one applied upgrade.
- `Searing Blow`: supports unbounded upgrades using the in-game scaling rule.

## Installation

```bash
pip install stsdb
```

Dev installation:

```bash
pip install -e .
```

### Usage

```bash
stsdb query_card "Bash"
stsdb query_card "Searing Blow" --upgrade-times 3
stsdb query_relic "Burning Blood"
python -m stsdb query_card "Bash"
```

### Python API

```python
import stsdb
from stsdb import query_card, query_relic

stsdb.query_card("Bash")
query_card("Bash")
query_card("Searing Blow", upgrade_times=3)
query_relic("Burning Blood")
```

### Local development

Install in development mode:

```bash
pip install -e .
```

Run tests:

```bash
python -m unittest discover -s tests -v
```

### Output

- Success: `{"found": true, "entry": {...}}`
- Card miss: `{"found": false, "error": "CARD_NOT_FOUND"}`
- Invalid upgrade input: `{"found": false, "error": "INVALID_UPGRADE_TIMES"}`
- Relic miss: `{"found": false, "error": "RELIC_NOT_FOUND"}`

## Other Notes

Data files are shipped inside the package under `stsdb/data/`:

- `card.csv`
- `relic.csv`
- `hero.csv`
- `play.csv`
- `relic_availability.csv`
- `card_upgrade.csv`

Upgrade metadata format (`card_upgrade.csv`):

- `nameCard;hasUpgrade;costUpgraded;descriptionUpgraded`

## Credits

This repository is adapted from the original project by [Ferdomgar97](https://github.com/ferdomgar97/Slay-the-Spire)
