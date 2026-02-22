import argparse
import csv
import json
from functools import lru_cache
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent
DATA_DIR = BASE_DIR / "Datos"


def _normalize_cost(raw_cost: str):
    if raw_cost == "NULL":
        return None
    return int(raw_cost)


@lru_cache(maxsize=1)
def _cards_by_name():
    cards = {}
    with (DATA_DIR / "card.csv").open("r", encoding="utf-8", newline="") as f:
        reader = csv.reader(f, delimiter=";")
        for row in reader:
            name, rarity, card_type, cost, description = row
            cards[name] = {
                "name": name,
                "rarity": None if rarity == "NULL" else rarity,
                "type": card_type,
                "cost": _normalize_cost(cost),
                "description": description,
            }
    return cards


@lru_cache(maxsize=1)
def _relics_by_name():
    relics = {}
    with (DATA_DIR / "relic.csv").open("r", encoding="utf-8", newline="") as f:
        reader = csv.reader(f, delimiter=";")
        for row in reader:
            name, rarity, description = row
            relics[name] = {
                "name": name,
                "rarity": rarity,
                "description": description,
            }
    return relics


@lru_cache(maxsize=1)
def _card_playable_by():
    card_map = {}
    with (DATA_DIR / "play.csv").open("r", encoding="utf-8", newline="") as f:
        reader = csv.reader(f, delimiter=";")
        for row in reader:
            card_name, hero_name = row
            card_map.setdefault(card_name, []).append(hero_name)
    return card_map


@lru_cache(maxsize=1)
def _relic_available_to():
    relic_map = {}
    with (DATA_DIR / "relic_availability.csv").open("r", encoding="utf-8", newline="") as f:
        reader = csv.reader(f, delimiter=";")
        for row in reader:
            relic_name, hero_name = row
            relic_map.setdefault(relic_name, []).append(hero_name)
    return relic_map


def query_card(name: str):
    card = _cards_by_name().get(name)
    if card is None:
        return {"found": False, "error": "CARD_NOT_FOUND"}

    entry = dict(card)
    entry["playable_by"] = _card_playable_by().get(name, [])
    return {"found": True, "entry": entry}


def query_relic(name: str):
    relic = _relics_by_name().get(name)
    if relic is None:
        return {"found": False, "error": "RELIC_NOT_FOUND"}

    entry = dict(relic)
    entry["available_to"] = _relic_available_to().get(name, [])
    return {"found": True, "entry": entry}


def _build_parser():
    parser = argparse.ArgumentParser(description="Deterministic exact-match query toolset")
    subparsers = parser.add_subparsers(dest="tool", required=True)

    card_parser = subparsers.add_parser("query_card", help="Query a card by exact name")
    card_parser.add_argument("name", help="Exact card name")

    relic_parser = subparsers.add_parser("query_relic", help="Query a relic by exact name")
    relic_parser.add_argument("name", help="Exact relic name")

    return parser


def main():
    parser = _build_parser()
    args = parser.parse_args()

    if args.tool == "query_card":
        result = query_card(args.name)
    else:
        result = query_relic(args.name)

    print(json.dumps(result, ensure_ascii=True))


if __name__ == "__main__":
    main()
