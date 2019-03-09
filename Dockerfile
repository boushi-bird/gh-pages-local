FROM ruby:2.5-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc make build-essential g++ \
    && rm -rf /var/lib/apt/lists/*

COPY ./Gemfile /src/

RUN bundle install --gemfile=/src/Gemfile

WORKDIR /src/site
EXPOSE 4000
CMD jekyll serve --source /src/app --watch --force_polling -H 0.0.0.0 -P 4000
