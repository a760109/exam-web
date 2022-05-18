# Basic build packs
FROM node:16.15.0-alpine3.14 AS builder
# RUN apk add --no-cache \
#     build-base \
#     g++ \
#     cairo-dev \
#     jpeg-dev \
#     pango-dev \
#     giflib-dev

# Build rdm_docs
# FROM builder as rdm_docs
# WORKDIR '/rdm_docs'
# COPY ./tars/rdm_docs ./
# RUN yarn install
# RUN yarn build

# Build exam
FROM builder as exam
WORKDIR '/exam'
# isolate node_modules layer
COPY package.json yarn.lock ./
RUN yarn install

# build fe src
COPY . ./
RUN yarn build

# Build final web server
FROM nginx:stable-alpine
COPY --from=exam /exam/build /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
# Self-signed cert for local testing
COPY nginx/key.pem /etc/nginx/key.pem
COPY nginx/cert.pem /etc/nginx/cert.pem
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
