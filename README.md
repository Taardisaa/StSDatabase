# Slay the Spire

A simple database project based on [Slay the Spire](https://www.megacrit.com/).

It contains three main tables:

- Hero
- Relic
- Card

These are connected through two relationship tables:

- `relic_availability.csv`
- `play.csv`

Card data now includes Watcher cards sourced from the Slay the Spire wiki card list.
Upgraded card variants are tracked in `stsdb/data/card_upgrade.csv` with this format:

- `nameCard;hasUpgrade;costUpgraded;descriptionUpgraded`

## External query toolset

This repository includes a deterministic Python package toolset with two commands:

- `query_card`
- `query_relic`

Both commands use exact name matching only (no fuzzy match, no partial match, no fallback).

### Usage

```bash
stsdb query_card "Bash"
stsdb query_card "Searing Blow" --upgrade-times 3
stsdb query_relic "Burning Blood"
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

```bash
pip install -e .
python -m unittest discover -s tests -v
```

### Output

- Success: `{"found": true, "entry": {...}}`
- Card miss: `{"found": false, "error": "CARD_NOT_FOUND"}`
- Invalid upgrade input: `{"found": false, "error": "INVALID_UPGRADE_TIMES"}`
- Relic miss: `{"found": false, "error": "RELIC_NOT_FOUND"}`


## Credits

This repository is adapted from the original project by [Ferdomgar97](https://github.com/ferdomgar97/Slay-the-Spire)
