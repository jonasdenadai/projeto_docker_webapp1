# Utilizar o RUBY 3.1.2 e o Linux Alpine 3.16
FROM ruby:3.1.2-alpine3.16

# Instalar pacotes e dependências necessárias para rodar o aplicativo 
RUN apk add --update --no-cache nano curl git nodejs build-base tzdata imagemagick sqlite-dev libxml2-dev libxslt-dev

# Criar o diretório padrão para a cópia do aplicativo
RUN mkdir /app

# Utilizar o diretório craido como diretório de trabalho
WORKDIR /app

# Copiar o Gemfile com a versão do Rails que queremos instalar e o Gemfile.lock para o correto funcionamento do bundle 
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

# Rodar o bundle
RUN bundle install -j 20

# Copiar tudo para o diretório /app

COPY . .
