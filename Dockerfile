FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev cron

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
apt-get install nodejs

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

RUN mkdir /app
WORKDIR /app
ADD docker-entrypoint.sh /

RUN apt-get update \
  && apt-get install -y cpanminus make \
  && cpanm Getopt::Std LWP::UserAgent

RUN gem install bundler

RUN cd /opt/ \
    && git clone https://github.com/hchiba1/spang.git \
    && cd spang \
    && npm install \
    && npm link    

EXPOSE 3000

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
