FROM node:20-alpine3.18 AS build

WORKDIR /app
COPY package* ./

RUN npm install

COPY ./ ./
RUN npm run build


FROM node:20-alpine3.18 AS next
LABEL org.opencontainers.image.source https://github.com/geoffroyBel/boujou

WORKDIR /app

COPY --from=build /app/package.json /app/
COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app/.next /app/.next
COPY --from=build /app/public /app/public

EXPOSE 3000

CMD npm run start