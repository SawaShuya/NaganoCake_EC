## infratop dockerの導入
- Docker, docker-compose.ymlをコピー(ruby2.6.3)

- gemfileにpostgreを追加
```
gem 'pg', '~> 1.1'
```

- detabase.ymlを変更
```
default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: password
  host: postgres_infratop

development:
  <<: *default
  database: develop_postgresql

test:
  <<: *default
  database: test_postgresql

production:
  <<: *default

```
- ```docker-compose build```

- ```docker-compose up -d```

- ```docker-compose run web rails db:create```

- ```docker-compose run web rails db:migrate```

- ```docker-compose up```

