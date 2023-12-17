# Stage 1: Build React App
FROM node:latest as builder

LABEL "MAINTAINER"="eonyong.jung <unjoo94@naver.com>"

WORKDIR /app

COPY . .

RUN yarn install
RUN yarn build

# Stage 2: Deploy with Nginx
FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
