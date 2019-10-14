FROM node:10.16.3 AS build-env

WORKDIR /app
COPY resource/igv-webapp/package*.json ./
RUN npm install

COPY resource/igv-webapp ./

RUN npm run build

FROM node:alpine
COPY --from=build-env /app/dist /app/dist

RUN npm install -g http-server
WORKDIR /app
EXPOSE 8080

CMD ["http-server", "dist"]
