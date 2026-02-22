import argparse
import json

from .core import query_card, query_relic


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
