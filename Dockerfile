FROM node:20-alpine3.18
LABEL org.opencontainers.image.source https://github.com/geoffroyBel/boujou
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD npm run dev