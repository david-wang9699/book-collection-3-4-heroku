FROM ruby:3.3.9

# Install system dependencies, Node.js, and Yarn (modern keyring method)
RUN apt-get update -qq && apt-get install -y curl gnupg build-essential libpq-dev nodejs \
  && mkdir -p /usr/share/keyrings \
  && curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarnkey.gpg \
  && echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" \
     | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq && apt-get install -y yarn

WORKDIR /app

# Install a newer Bundler to avoid metadata bug
RUN gem install bundler:2.5.17

# Copy only Gemfile first, install gems, then copy the rest
COPY Gemfile ./
RUN bundle install

COPY . .

EXPOSE 3000
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0 -p 3000"]