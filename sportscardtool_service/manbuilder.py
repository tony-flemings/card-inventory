import argparse
import subprocess
import os

MAN_DIR = "docs/manpages"
WRAPPER = "./api_tool_wrapper.sh"
COMMANDS = ["fetch", "search-ebay", "pricechart"]

def generate_man_pages():
    os.makedirs(MAN_DIR, exist_ok=True)
    for cmd in COMMANDS:
        output = os.path.join(MAN_DIR, f"api_tool-{cmd}.1")
        subprocess.run([
            "help2man", "-N", "-n", f"{cmd} command for api_tool",
            WRAPPER, cmd
        ], stdout=open(output, "w"))
    print("✅ Man pages generated.")

def list_man_pages():
    for file in os.listdir(MAN_DIR):
        if file.endswith(".1"):
            print(f"- {file}")

def clean_man_pages():
    for file in os.listdir(MAN_DIR):
        if file.endswith(".1"):
            os.remove(os.path.join(MAN_DIR, file))
    print("🧹 Man pages cleaned.")

def main():
    parser = argparse.ArgumentParser(description="Man Page CLI for api_tool")
    sub = parser.add_subparsers(dest="command")

    sub.add_parser("generate")
    sub.add_parser("list")
    sub.add_parser("clean")

    args = parser.parse_args()
    if args.command == "generate":
        generate_man_pages()
    elif args.command == "list":
        list_man_pages()
    elif args.command == "clean":
        clean_man_pages()
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
