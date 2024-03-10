# Rubyのバージョンを指定
FROM ruby:3.1

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs npm default-mysql-client
RUN npm install --global yarn

# 作業ディレクトリの設定
WORKDIR /myapp

# ホストのGemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Bundlerを使ってGemをインストール
RUN bundle install

# ホストの現在のディレクトリの内容をコンテナの作業ディレクトリにコピー
COPY . /myapp

# コンテナがリッスンするポート番号を指定
EXPOSE 3000

# デフォルトでRailsサーバーを起動するコマンド
CMD ["rails", "server", "-b", "0.0.0.0"]
