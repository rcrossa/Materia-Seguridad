FROM node:16-alpine3.14 as base
WORKDIR /src
COPY package*.json /
EXPOSE 3000

FROM base AS production
ENV NODE_ENV=production
COPY . /
RUN npm ci
CMD ["node", "bin/www"]

FROM base AS dev
ENV NODE_ENV=development
COPY . /
RUN npm install -g nodemon && npm install
CMD ["nodemon", "bin/www"]