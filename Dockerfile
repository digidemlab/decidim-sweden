ARG ruby_version=3.2.6

FROM ruby:${ruby_version}
LABEL maintainer="support@digidemlab.org"

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

WORKDIR /code

RUN apt-get --allow-releaseinfo-change update

RUN apt-get install -y git imagemagick wget postgresql-client cron \
  && apt-get clean

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get install -y nodejs \
  && apt-get clean

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
