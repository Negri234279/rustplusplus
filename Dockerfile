FROM node:22

RUN apt-get update \
    && apt-get install -y graphicsmagick \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

VOLUME [ "/app/credentials", "/app/instances", "/app/logs", "/app/maps" ]

CMD ["npm", "start"]
