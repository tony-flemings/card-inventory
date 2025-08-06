FROM python:3.11-slim

WORKDIR /app

# Copy everything into the container
COPY . /app

# Install dependencies (editable install + Flask + SerpAPI)
RUN pip install --no-cache-dir -e .

# Expose Flask port
EXPOSE 5000

# Run the Flask app instead of CLI
CMD ["python", "run.py"]
