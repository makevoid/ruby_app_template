FROM ruby:3.1.0-alpine3.15

RUN apk --no-cache add make gcc libc-dev \
    rm -rf /var/cache/apk/*


WORKDIR /app

ADD Gemfile* ./
RUN bundle install

ADD . /app

CMD rake
