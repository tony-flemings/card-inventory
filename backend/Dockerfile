# Use official Node.js image
FROM node:20

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the backend code
COPY . .

# Optional: Set environment variable for shared volume path
ENV CARD_DATA_PATH=/app/data

# Start the ingestion script or your backend server
CMD ["node", "ingest.js"]
