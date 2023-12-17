# Stage 1: Build React App
FROM node:latest as builder

LABEL "MAINTAINER"="eonyong.jung <unjoo94@naver.com>"

RUN yarn install
RUN yarn create react-app todos --template typescript

RUN yarn build


# Stage 2: Deploy with Nginx
FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
