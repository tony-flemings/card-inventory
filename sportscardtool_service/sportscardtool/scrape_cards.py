# scrape_cards.py

import argparse
from .scraping_tool import run_scraper  # Or from scraper.utils.safe_tcdb import scrape_tcdb

def main():
    parser = argparse.ArgumentParser(
        description="SportsCardTool CLI - Scrape trading card data from various sources"
    )

    parser.add_argument(
        "--source",
        choices=["tcdb", "pricecharting"],
        required=True,
        help="Source to scrape from (e.g., tcdb or pricecharting)"
    )

    parser.add_argument(
        "--limit",
        type=int,
        default=50,
        help="Maximum number of cards to scrape"
    )

    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Run without saving to database"
    )

    args = parser.parse_args()

    print(f"🟢 Starting scrape from {args.source} (limit: {args.limit}, dry-run: {args.dry_run})")

    try:
        # Example: call your scraping logic
        run_scraper(source=args.source, limit=args.limit, dry_run=args.dry_run)
        print("✅ Scraping completed.")
    except Exception as e:
        print(f"❌ Error during scraping: {e}")

if __name__ == "__main__":
    main()
