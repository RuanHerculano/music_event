FROM ruby:2.6.5-alpine

RUN apk add --no-cache \
    tzdata build-base nodejs \
    cmake git \
    postgresql-client postgresql-dev \
    curl

RUN gem install bundler

RUN mkdir /app

WORKDIR /app

COPY Gemfile /app

COPY Gemfile.lock /app

RUN bundle install

COPY . /app

EXPOSE 3000

ENTRYPOINT ["sh", "post-up.sh"]
