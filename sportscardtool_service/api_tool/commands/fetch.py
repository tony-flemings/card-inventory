import click
import requests
import json
from pathlib import Path
from datetime import datetime
from dotenv import load_dotenv
import os

load_dotenv()
API_KEY = os.getenv('SERPAPI_KEY')

@click.command()
@click.option('--set', required=True, help='Card set to fetch')
@click.option('--year', required=False, help='Year to filter cards')
@click.option('--limit', default=50, help='Number of cards to fetch')
@click.option('--outdir', default='output', help='Directory to save output')
@click.option('--verbose', is_flag=True, help='Print request and response details')
def fetch(set, year, limit, outdir, verbose):
    """Fetch cards from the API and save to a timestamped JSON file."""
    params = {'set': set, 'limit': limit}
    if year:
        params['year'] = year

    headers = {'Authorization': f'Bearer {API_KEY}'} if API_KEY else {}

    url = "http://localhost:3000/api/cards"
    if verbose:
        click.echo(f"🔍 Request URL: {url}")
        click.echo(f"🔍 Query Params: {params}")
        click.echo(f"🔍 Headers: {headers}")

    response = requests.get(url, params=params, headers=headers)

    if verbose:
        click.echo(f"🔍 Response Status: {response.status_code}")
        try:
            click.echo(f"🔍 Response Preview:\n{json.dumps(response.json()[:3], indent=2)}")
        except Exception:
            click.echo("🔍 Response not JSON or failed to parse.")

    if response.ok:
        data = response.json()

        out_path = Path(outdir)
        out_path.mkdir(parents=True, exist_ok=True)

        timestamp = datetime.now().strftime('%Y%m%d_%H%M')
        year_suffix = f"{year}_" if year else ""
        filename = f"cards_{year_suffix}{timestamp}.json"
        file_path = out_path / filename

        file_path.write_text(json.dumps(data, indent=2))
        click.echo(f"✅ Saved {len(data)} cards to {file_path.resolve()}")
    else:
        click.echo(f"❌ Failed to fetch cards: {response.status_code}")
