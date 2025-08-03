FROM python:3.11-slim

WORKDIR /app

# Copy the inner package and setup.py
COPY SportsCardTool/SportsCardTool /app/SportsCardTool
COPY setup.py /app/

# Install the package
RUN pip install -e .

# Optional: run your scraper script
CMD ["python", "-m", "SportsCardTool.scrape_cards"]
