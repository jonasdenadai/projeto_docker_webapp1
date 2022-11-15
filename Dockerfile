
FROM ruby:3.1.2-alpine3.16

RUN apk add --update --no-cache nano curl git nodejs build-base tzdata imagemagick sqlite-dev libxml2-dev libxslt-dev

RUN mkdir /app

WORKDIR /app


#RUN gem install rails -v 7.0.4 --no-document

# copiar o Gemfile
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

# Rodar o bundle install com 20 tarefas concorrentes
RUN bundle install -j 20
# Copiar tudo da raiz para o diretório /app

COPY . .
