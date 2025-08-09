import argparse
from api_tool.routes import fetch_by_id, fetch_by_upc, search_by_name
from api_tool.output import format_output

def register_pricechart_command(subparsers):
    parser = subparsers.add_parser("pricechart", help="Query PriceCharting API")
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--id", help="Product ID")
    group.add_argument("--upc", help="UPC code")
    group.add_argument("--name", help="Search by name")
    parser.set_defaults(func=run_pricechart)

def run_pricechart(args):
    if args.id:
        result = fetch_by_id(args.id)
    elif args.upc:
        result = fetch_by_upc(args.upc)
    elif args.name:
        result = search_by_name(args.name)
    print(format_output(result))
