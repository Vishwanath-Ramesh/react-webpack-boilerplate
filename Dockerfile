FROM node:alpine as builder

WORKDIR /usr/app

COPY ./package.json ./

RUN yarn install

COPY ./ ./

RUN yarn build

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html