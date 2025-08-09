import argparse
import importlib
import pkgutil
import commands  # This is your commands/ package
from tabulate import tabulate
from fuzzywuzzy import fuzz
from fuzzywuzzy import process


def discover_commands(subparsers):
    for loader, module_name, is_pkg in pkgutil.iter_modules(commands.__path__):
        module = importlib.import_module(f"commands.{module_name}")
        if hasattr(module, "register"):
            module.register(subparsers)

def main():
    parser = argparse.ArgumentParser(description="API Tool CLI")
    subparsers = parser.add_subparsers(dest="command", required=True)

    discover_commands(subparsers)

    args = parser.parse_args()
    args.func(args)

def format_output(data):
    if "error" in data:
        return data["error"]
    table = [
        ["Name", data.get("product_name", "N/A")],
        ["Console", data.get("console_name", "N/A")],
        ["Loose", f"${data.get('loose_price', 'N/A')}"],
        ["Complete", f"${data.get('complete_price', 'N/A')}"],
        ["New", f"${data.get('new_price', 'N/A')}"],
    ]
    return tabulate(table, headers=["Field", "Value"], tablefmt="github")

def best_match(query, results):
    names = [item["product_name"] for item in results]
    match, score = process.extractOne(query, names)
    for item in results:
        if item["product_name"] == match:
            return item
    return None


if __name__ == "__main__":
    main()
