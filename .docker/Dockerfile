FROM ruby:3.0
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  nodejs postgresql-client cron locales build-essential npm \
  libpq-dev sudo vim git curl imagemagick libzbar-dev liblzma-dev zlib1g-dev \
  ghostscript && apt-get clean && rm -rf /var/lib/apt/lists/* && gem update --system

ENV APP_ROOT /api
RUN mkdir -p $APP_ROOT 

# Set command execution path
WORKDIR $APP_ROOT

COPY /Gemfile $APP_ROOT/Gemfile
COPY /Gemfile.lock $APP_ROOT/Gemfile.lock

# Install gems
RUN bundle install

# Add a script to be executed every time the container starts.
COPY ./.docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Copy all project files to application folder inside container
COPY . $APP_ROOT
