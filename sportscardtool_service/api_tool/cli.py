import click
from commands.fetch import fetch
from commands.search_ebay import search_ebay
#from commands.update import update
#from commands.diagnose import diagnose
#from commands.stage import stage

@click.group()
def cli():
    """CLI tool for interacting with the card inventory API."""
    pass

cli.add_command(fetch)
cli.add_command(search_ebay)
#cli.add_command(update)
#cli.add_command(diagnose)
#cli.add_command(stage)

if __name__ == '__main__':
    cli()
