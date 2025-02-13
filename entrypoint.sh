#!/bin/bash

cat <<EOS > config/database.yml
default: &default
    adapter: sqlite3
    database: db/redmine.sqlite3
development:
    <<: *default
test:
    <<: *default
EOS

cat <<EOS > config/s3.yml
default: &default
  access_key_id: dummy
  secret_access_key: dummy
  bucket: bucket
  folder: files
  thumb_folder: thumbnails
  import_folder: imports
  endpoint: https://s3.localhost.localstack.cloud:4566
development:
    <<: *default
test:
    <<: *default
EOS

bundle install
bin/rails db:prepare

exec "$@"
