FROM ruby:3.2.2-alpine

RUN apk --no-cache add make gcc libc-dev \
    rm -rf /var/cache/apk/*

RUN mkdir -p /app
WORKDIR /app

ADD Gemfile* ./
RUN bundle install

ADD . /app

CMD rake
