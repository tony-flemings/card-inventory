# server/Dockerfile

FROM node:20

WORKDIR /app

COPY . .

RUN apt update && apt install -y netcat-traditional
RUN chmod +x wait-for-it.sh

CMD ["./wait-for-it.sh", "db:3306", "--", "node", "server.js"]
