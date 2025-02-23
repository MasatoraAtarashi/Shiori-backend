# syntax=docker/dockerfile:1
#FROM ruby:2.5.5
#RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
#WORKDIR /myapp
#COPY Gemfile /myapp/Gemfile
#COPY Gemfile.lock /myapp/Gemfile.lock
#RUN bundle install
#
## Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
#EXPOSE 3000
#
## Configure the main process to run when running the image
#CMD ["rails", "server", "-b", "0.0.0.0"]

FROM ruby:2.5.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client build-essential libpq-dev vim

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

# Expose volumes to frontend
VOLUME /app/public
VOLUME /app/tmp

# Start Server
# TODO: environment
CMD bundle exec puma
