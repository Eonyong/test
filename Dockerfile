FROM ubuntu:18.04

LABEL "MAINTAINER"="eonyong.jung <unjoo94@naver.com>"

RUN \
  apt-get update && \
  apt-get install -y yarn

EXPOSE 80

CMD [ "yarn", "create", "react-app", "todos", "--template", "typescript" ]
