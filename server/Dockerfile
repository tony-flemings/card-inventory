# server/Dockerfile

FROM node:20

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

HEALTHCHECK --interval=10s --timeout=5s --start-period=5s --retries=3 \
  CMD node healthcheck.js || exit 1

CMD ["./wait-for-it.sh", "db:3306", "--", "node", "server.js"]
