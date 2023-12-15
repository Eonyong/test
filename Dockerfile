FROM node:latest

LABEL "MAINTAINER"="eonyong.jung <unjoo94@naver.com>"

RUN yarn create react-app todos --template typescript
