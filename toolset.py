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
def _card_upgrade_by_name():
    upgrades = {}
    with (DATA_DIR / "card_upgrade.csv").open("r", encoding="utf-8", newline="") as f:
        reader = csv.reader(f, delimiter=";")
        for row in reader:
            card_name, has_upgrade, cost_upgraded, description_upgraded = row
            upgrades[card_name] = {
                "has_upgrade": has_upgrade == "true",
                "cost_upgraded": _normalize_cost(cost_upgraded),
                "description_upgraded": description_upgraded,
            }
    return upgrades


@lru_cache(maxsize=1)
def _relic_available_to():
    relic_map = {}
    with (DATA_DIR / "relic_availability.csv").open("r", encoding="utf-8", newline="") as f:
        reader = csv.reader(f, delimiter=";")
        for row in reader:
            relic_name, hero_name = row
            relic_map.setdefault(relic_name, []).append(hero_name)
    return relic_map


def _apply_searing_blow_upgrades(base_card, upgrade_times: int):
    if upgrade_times <= 0:
        return base_card

    base_damage = 12
    upgraded_damage = (upgrade_times * (upgrade_times + 7)) // 2 + base_damage
    upgraded_description = f"Deal {upgraded_damage} damage. Can be Upgraded any number of times."

    upgraded_card = dict(base_card)
    upgraded_card["description"] = upgraded_description
    return upgraded_card


def query_card(name: str, upgrade_times: int = 0):
    if upgrade_times < 0:
        return {"found": False, "error": "INVALID_UPGRADE_TIMES"}

    card = _cards_by_name().get(name)
    if card is None:
        return {"found": False, "error": "CARD_NOT_FOUND"}

    entry = dict(card)
    upgrade_info = _card_upgrade_by_name().get(name)

    applied_upgrade_times = 0
    max_upgrade_times = 0

    if name == "Searing Blow":
        entry = _apply_searing_blow_upgrades(entry, upgrade_times)
        applied_upgrade_times = upgrade_times
        max_upgrade_times = -1
    elif upgrade_info and upgrade_info["has_upgrade"]:
        max_upgrade_times = 1
        if upgrade_times > 0:
            applied_upgrade_times = 1
            entry["cost"] = upgrade_info["cost_upgraded"]
            entry["description"] = upgrade_info["description_upgraded"]

    entry["playable_by"] = _card_playable_by().get(name, [])
    entry["requested_upgrade_times"] = upgrade_times
    entry["applied_upgrade_times"] = applied_upgrade_times
    entry["max_upgrade_times"] = max_upgrade_times
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
    card_parser.add_argument(
        "--upgrade-times",
        type=int,
        default=0,
        help="Requested upgrade count (default: 0)",
    )

    relic_parser = subparsers.add_parser("query_relic", help="Query a relic by exact name")
    relic_parser.add_argument("name", help="Exact relic name")

    return parser


def main():
    parser = _build_parser()
    args = parser.parse_args()

    if args.tool == "query_card":
        result = query_card(args.name, args.upgrade_times)
    else:
        result = query_relic(args.name)

    print(json.dumps(result, ensure_ascii=True))


if __name__ == "__main__":
    main()
