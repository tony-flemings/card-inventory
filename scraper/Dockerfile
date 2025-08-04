FROM python:3.11-slim

RUN apt update && apt install -y git

ENV PYTHONPATH="/usr/bin/git:${PYTHONPATH}"

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY utils/ ./utils
COPY data/ ./data
COPY logs/ ./logs

CMD ["python", "utils/safe_tcdb.py"]
