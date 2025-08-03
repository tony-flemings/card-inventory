# server/Dockerfile

FROM node:20

WORKDIR /app

COPY . .

RUN chmod +x wait-for-it.sh

CMD ["./wait-for-it.sh", "db:3306", "--", "node", "server.js"]
