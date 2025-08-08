import os
import click
import requests
import json
from pathlib import Path
from datetime import datetime
from dotenv import load_dotenv

load_dotenv()

@click.command()
@click.option("--query", "-q", help="Search keyword (e.g. 'Jordan rookie')", required=False)
@click.option("--category-id", "-c", default="261328", help="eBay category ID (default: Sports Trading Cards)")
@click.option("--limit", "-l", default=50, help="Items per page (max 200)")
@click.option("--sold", is_flag=True, help="Show only sold listings")
@click.option("--buy-it-now", is_flag=True, help="Show only Buy It Now listings")
@click.option("--verbose", is_flag=True, help="Print raw response for debugging")
@click.option("--out", default=None, help="Save results to a JSON file")
def search_ebay(query, category_id, limit, sold, buy_it_now, verbose, out):
    """Search eBay for trading cards using SerpApi."""
    api_key = os.getenv("SERPAPI_KEY")
    if not api_key:
        click.echo("❌ Missing SERPAPI_KEY in environment")
        return

    params = {
        "engine": "ebay",
        "category_id": category_id,
        "_ipg": limit,
        "api_key": api_key,
        "ebay_domain": "ebay.com"
    }

    if query:
        params["_nkw"] = query
    if sold:
        params["LH_Sold"] = "1"
    if buy_it_now:
        params["LH_BIN"] = "1"

    click.echo(f"🔍 Searching eBay for: {query or '[no keyword]'} in category {category_id}")
    response = requests.get("https://serpapi.com/search.json", params=params)

    if verbose:
        click.echo(response.text)

    if response.status_code != 200:
        click.echo(f"❌ Request failed: {response.status_code}")
        return

    data = response.json()
    results = data.get("organic_results", [])

    if not results:
        click.echo("⚠️ No results found.")
        return

    for item in results:
        title = item.get("title", "No title")
        price = item.get("price", "No price")
        link = item.get("link", "No link")
        click.echo(f"🃏 {title}\n💲 {price}\n🔗 {link}\n")

    if out:
        timestamp = datetime.now().strftime('%Y%m%d_%H%M')
        filename = f"{out}_{timestamp}.json" if not out.endswith(".json") else out
        out_path = Path("output") / filename
        out_path.parent.mkdir(parents=True, exist_ok=True)
        out_path.write_text(json.dumps(results, indent=2))
        click.echo(f"✅ Saved {len(results)} results to {out_path.resolve()}")

