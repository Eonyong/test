# Stage 1: Build React App
FROM node:latest as builder

LABEL "MAINTAINER"="eonyong.jung <unjoo94@naver.com>"

WORKDIR /app

# Install dependencies
RUN yarn install

# Copy the entire application
COPY . .

# Create React App with TypeScript
RUN yarn create react-app todos --template typescript

RUN echo ls

# Copy package.json and yarn.lock to ensure correct versions are installed
COPY /app/todos/package.json /app/todos/yarn.lock ./

# Change working directory to the newly created React app
WORKDIR /app/todos

# Build the React app
RUN yarn build

# Stage 2: Deploy with Nginx
FROM nginx:alpine

# Copy the built files from the previous stage
COPY --from=builder /app/todos/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
