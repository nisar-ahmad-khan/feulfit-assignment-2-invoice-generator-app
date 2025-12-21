#!/usr/bin/env bash
set -e  # Exit immediately if a command exits with a non-zero status

echo "=== Installing gems ==="
bundle install --jobs 4 --retry 3

echo "=== Running database migrations ==="
bundle exec rails db:migrate RAILS_ENV=production

echo "=== Precompiling assets ==="
bundle exec rails assets:precompile RAILS_ENV=production

echo "=== Cleaning old assets ==="
bundle exec rails assets:clean

echo "=== Build finished successfully ==="