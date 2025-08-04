# scraper/Dockerfile

FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies including Git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your scraper code
COPY scraper/ /app/
COPY SportsCardTool/ /app/SportsCardTool/

#Set PYTHONPATH so Python can find scraper/utils
ENV PYTHONPATH=/app/scraper

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the scraper
CMD ["python", "SportsCardTool/SportsCardTool/scrape_cards.py"]
