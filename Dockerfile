FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /graduation_exam
WORKDIR /graduation_exam
COPY Gemfile /graduation_exam/Gemfile
COPY Gemfile.lock /graduation_exam/Gemfile.lock
RUN bundle install
COPY . /graduation_exam

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
