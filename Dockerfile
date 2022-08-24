FROM ruby:3.1.2-alpine3.15
WORKDIR /myapp
RUN apk add bash
COPY . /myapp
CMD /bin/sh -c "while sleep 1000; do :; done"