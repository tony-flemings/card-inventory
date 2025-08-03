# scraper/Dockerfile

FROM python:3.11-slim

# Set working directory inside container
WORKDIR /app

# Copy everything from your project into the container
COPY . .

# Install dependencies listed in scraper/requirements.txt
RUN pip install --no-cache-dir -r scraper/requirements.txt

# Run the scraper script
CMD ["python", "app/SportsCardTool/SportsCardTool/scrape_cards.py"]
