FROM ruby:3.0.1-alpine3.13

RUN apk update && \
    apk add --no-cache build-base curl less git nodejs postgresql-dev postgresql-client tzdata nodejs-npm nodejs yarn && \
    rm -rf /var/cache/apk/*
ENV APP_HOME /educatit
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install
COPY . $APP_HOME

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

ENV LANG=C.UTF-8

CMD ["rails", "server", "-b", "0.0.0.0"]
