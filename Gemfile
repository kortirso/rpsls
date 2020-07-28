# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '~> 4.3.5'

# Different
gem 'therubyracer', platforms: :ruby

# Rules for migrations
gem 'strong_migrations'

# Dry-Rb
gem 'dry-initializer', '~> 3.0.2'
gem 'dry-types', '~> 1.4.0'
gem 'dry-validation', '~> 1.5.0'

# Model Serializers
gem 'fast_jsonapi'

# API documentation
gem 'apipie-rails', '0.5.8'

# token
gem 'jwt', '~> 2.2.1'

# rabbitmq
gem 'bunny', '~> 2.15.0'

group :development, :test do
  # testing
  gem 'database_cleaner', '~> 1.8.5'
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'rspec-rails', '~> 4.0.1'
  # Static analysis
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  # N+1 query detector
  gem 'bullet', '~> 6.1.0'
end

group :development do
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'json_spec'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
