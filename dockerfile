FROM ruby:2.3-slim
# install dependences
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev
# set path
ENV INSTALL_PATH /usr/src/app
# create dir
RUN mkdir -p $INSTALL_PATH
# main dir as path
WORKDIR $INSTALL_PATH
# copy Gemfile to container
COPY Gemfile ./
# gem install
RUN bundle install
# copy code to container
COPY . .
# run server
CMD puma -C config/puma.rb
