FROM python:3.11-slim

WORKDIR /app

# Copy CLI package
COPY ../setup.py .
COPY . /app/SportsCardTool

# Install CLI tool
RUN pip install --no-cache-dir -e .

CMD ["sportscardtool"]
