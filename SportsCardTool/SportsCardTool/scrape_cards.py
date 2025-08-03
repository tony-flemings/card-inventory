import argparse
import os
import sys
import pandas as pd

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'SportsCardTool')))

from scraping_tool import grab_card_list, grab_year_links
from pathlib import Path
from loguru import logger
#from SportsCardTool.scraping_tool import grab_card_list, grab_year_links
from utils.db_insert import insert_cards_to_db

def get_args():
    parser = argparse.ArgumentParser(description="Scrape trading card data.")
    parser.add_argument(
        "--terms",
        type=str,
        help="Comma-separated list of search terms (e.g. 'Ken Griffey Jr, Mike Trout')"
    )
    parser.add_argument(
        "--output",
        type=str,
        default="output",
        help="Directory to save CSV files"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Run scraper without saving to DB or writing CSV"
    )
    return parser.parse_args()

def sanitize_filename(name: str) -> str:
    return name.replace(" ", "_").replace("/", "_")

if __name__ == "__main__":
    args = get_args()
    search_terms = args.terms.split(",") if args.terms else [os.getenv("SCRAPER_SEARCH_TERM", "Ken Griffey Jr")]
    output_dir = Path(args.output)
    output_dir.mkdir(exist_ok=True)

    for term in search_terms:
        term = term.strip()
        logger.info(f"Scraping cards for: {term}")
        cards = scraping_tool.grab_card_list(term)

        if args.dry_run:
            logger.info(f"[Dry Run] Scraped {len(cards)} cards for '{term}'")
            continue

        db_insert(cards)
        df = pd.DataFrame(cards)
        output_path = output_dir / f"{sanitize_filename(term)}_cards.csv"
        df.to_csv(output_path, index=False)
        logger.success(f"Saved {len(cards)} cards to {output_path}")
