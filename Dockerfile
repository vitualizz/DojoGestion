FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /Dojo
WORKDIR /Dojo
COPY Gemfile /Dojo/Gemfile
COPY Gemfile.lock /Dojo/Gemfile.lock
RUN bundle install
RUN chown -R $USER:$USER .
COPY . /Dojo
