FROM ruby:3.0.2

ENV LANG C.UTF-8

RUN rm -rf /var/cache/apk/*

# ディレクトリ・ファイルの作成
WORKDIR /be
COPY Gemfile /be/Gemfile
COPY Gemfile.lock /be/Gemfile.lock

# heroku用に2.1.4に固定
RUN gem install bundler -v 2.1.4

# gem(Rails6)のインストール
RUN bundle _2.1.4_ install

RUN bundle config build.nokogiri -- \
    --use-system-libraries \
    --with-xml2-config=/usr/bin/xml2-config \
    --with-xslt-config=/usr/bin/xslt-config

COPY . /be

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENV PORT 3000
ENV HOST 0.0.0.0
EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
