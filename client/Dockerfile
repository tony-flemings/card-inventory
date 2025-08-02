# Use official Node.js image
FROM node:22.2.0

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Build the Vite app
RUN npm run build

# Use a lightweight web server to serve the built files
RUN npm install -g serve
CMD ["serve", "-s", "dist"]

# Expose the port Vite will serve on
EXPOSE 5173
