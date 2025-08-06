# sportscardtool/cli.py
import argparse
from sportscardtool.scrape_cards import run_scraper  # or whatever your main function is

def main():
    parser = argparse.ArgumentParser(description="Sports Card Scraper CLI")
    parser.add_argument("query", help="Search term")
    parser.add_argument("--limit", type=int, default=10)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    run_scraper(query=args.query, limit=args.limit, dry_run=args.dry_run)

if __name__ == "__main__":
    main()
