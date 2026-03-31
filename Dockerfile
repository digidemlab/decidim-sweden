ARG ruby_version=3.3.4

FROM ruby:${ruby_version}
LABEL maintainer="support@digidemlab.org"

ENV NODE_VERSION 20.20.2

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV RAILS_ENV=production
# secret key won't be used during init/build but has to be set.
# will be overriden.
ENV SECRET_KEY_BASE=dummy
ENV INFOBIP_APP_IDENTIFIER=dummy
ENV INFOBIP_BASEURL=dummy
ENV INFOBIP_APIKEY=dummy
ENV INFOBIP_SENDERID=dummy
ENV DECIDIM_STORAGE_SERVICE=test

WORKDIR /code

RUN apt-get --allow-releaseinfo-change update

RUN apt-get install -y git imagemagick wget postgresql-client cron \
  && apt-get clean

ENV NVM_DIR /usr/local/nvm

RUN mkdir $NVM_DIR
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash - \
  && . $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install -g yarn@1.22.22
RUN gem install bundler --version '>= 2.7'

COPY . .

RUN bundle install
RUN yarn install
RUN bin/rails runner "Decidim::Assets::Tailwind.write_runtime_configuration"
RUN bundle exec rake assets:precompile

RUN chmod -R 777 .

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bundle", "exec", "passenger", "start"]
