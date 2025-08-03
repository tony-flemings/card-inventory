WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -e .
