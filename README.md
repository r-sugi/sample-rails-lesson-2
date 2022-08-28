## setup
### 環境構築方法
1. docker-compose.yml内のplatformを変更する
- intel Macの場合は`platform: linux/amd64`のみにする（platform: linux/x86_64を削除する）
- M1 Macの場合は`platform: linux/x86_64`のみにする（platform: linux/amd64を削除する）

2. dockerに関するコマンドを実行する
```
docker-compose up
※この場合、画面にログが出力される
```

```
docker-compose up -d
※この場合、画面にログが出力されない
```

下記のようなログが出力される(databaseが存在しないというエラー)
※ブラウザで`http://localhost:3009`にアクセスして確認できる

```
be-app2 | => Booting Puma
be-app2 | => Rails 6.0.5.1 application starting in development
be-app2 | => Run `rails server --help` for more startup options
be-app2 | Puma starting in single mode...
be-app2 | * Version 4.3.12 (ruby 3.0.2-p107), codename: Mysterious Traveller
be-app2 | * Min threads: 5, max threads: 5
be-app2 | * Environment: development
be-app2 | * Listening on tcp://0.0.0.0:3000
be-app2 | Use Ctrl-C to stop
be-app2 | Started GET "/" for 172.22.0.1 at 2022-08-26 14:28:25 +0000
be-app2 |

省略

be-app2 | ActiveRecord::NoDatabaseError (Unknown database 'be_development'):
be-app2 |
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_adapters/mysql2_adapter.rb:28:in `rescue in mysql2_connection'
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_adapters/mysql2_adapter.rb:14:in `mysql2_connection'
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_adapters/abstract/connection_pool.rb:887:in `new_connection'
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_adapters/abstract/connection_pool.rb:931:in `checkout_new_connection'
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_adapters/abstract/connection_pool.rb:910:in `try_to_checkout_new_connection'
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_adapters/abstract/connection_pool.rb:871:in `acquire_connection'
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_adapters/abstract/connection_pool.rb:593:in `checkout'
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_adapters/abstract/connection_pool.rb:437:in `connection'
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_adapters/abstract/connection_pool.rb:1125:in `retrieve_connection'
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_handling.rb:221:in `retrieve_connection'
be-app2 | activerecord (6.0.5.1) lib/active_record/connection_handling.rb:189:in `connection'
be-app2 | activerecord (6.0.5.1) lib/active_record/migration.rb:562:in `call'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/callbacks.rb:27:in `block in call'
be-app2 | activesupport (6.0.5.1) lib/active_support/callbacks.rb:101:in `run_callbacks'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/callbacks.rb:26:in `call'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/executor.rb:14:in `call'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/debug_exceptions.rb:32:in `call'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
be-app2 | railties (6.0.5.1) lib/rails/rack/logger.rb:37:in `call_app'
be-app2 | railties (6.0.5.1) lib/rails/rack/logger.rb:26:in `block in call'
be-app2 | activesupport (6.0.5.1) lib/active_support/tagged_logging.rb:80:in `block in tagged'
be-app2 | activesupport (6.0.5.1) lib/active_support/tagged_logging.rb:28:in `tagged'
be-app2 | activesupport (6.0.5.1) lib/active_support/tagged_logging.rb:80:in `tagged'
be-app2 | railties (6.0.5.1) lib/rails/rack/logger.rb:26:in `call'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/remote_ip.rb:81:in `call'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/request_id.rb:27:in `call'
be-app2 | rack (2.2.4) lib/rack/runtime.rb:22:in `call'
be-app2 | activesupport (6.0.5.1) lib/active_support/cache/strategy/local_cache_middleware.rb:29:in `call'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/executor.rb:14:in `call'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/static.rb:126:in `call'
be-app2 | rack (2.2.4) lib/rack/sendfile.rb:110:in `call'
be-app2 | actionpack (6.0.5.1) lib/action_dispatch/middleware/host_authorization.rb:97:in `call'
be-app2 | rack-cors (1.1.1) lib/rack/cors.rb:100:in `call'
be-app2 | railties (6.0.5.1) lib/rails/engine.rb:527:in `call'
be-app2 | puma (4.3.12) lib/puma/configuration.rb:228:in `call'
be-app2 | puma (4.3.12) lib/puma/server.rb:727:in `handle_request'
be-app2 | puma (4.3.12) lib/puma/server.rb:476:in `process_client'
be-app2 | puma (4.3.12) lib/puma/server.rb:332:in `block in run'
be-app2 | puma (4.3.12) lib/puma/thread_pool.rb:134:in `block in spawn_thread'
```

3. databaseを作成する
```
docker exec -it be-app2 bundle exec rails db:create
```

下記のようなログが出力されたら成功
```
Created database 'be_development'
Created database 'be_test'
```

4. データベースをsetupする
データベースにテーブルを作成する
```
docker exec -it be-app2 bundle exec rails db:migrate
```

シードデータを投入する
```
docker exec -it be-app2 bundle exec rails db:seed
```

5. ブラウザで`http://localhost:3009`にアクセスとトップページが表示される


### bundleのバージョンについて
herokuの対応バージョンが2.1.4のためこのバージョンに固定しています
ローカルでのインストール方法
　※Gemfile.lockを削除した上で実行すること
```
gem install bundler -v 2.1.4
bundle _2.1.4_ install
```

### bootstrap 5
https://getbootstrap.jp/docs/5.0/getting-started/introduction/
