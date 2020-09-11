source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Core
gem 'rails', '~> 5.2.4'
gem 'bootsnap', '>= 1.1.0', require: false

# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

# Frontend
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'chartkick'
gem 'jquery-rails'
gem 'bootstrap', '~> 4.5.0'
gem 'font-awesome-sass', '~> 5.13.0'
gem 'kaminari'

# Backend
gem 'jbuilder', '~> 2.5'
gem 'seed-fu'
gem 'carrierwave'
gem 'mini_magick'
gem 'ransack'
gem 'fog-aws'
gem 'dotenv-rails'

# Authentication
gem 'devise'
gem 'devise-i18n'
gem 'rails_admin'
gem 'cancancan'

# Dev tool for Production
gem 'faker'
gem 'letter_opener_web'

# for AWS
gem 'unicorn'
gem 'mini_racer', platforms: :ruby


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'capistrano', '3.6.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :development do
  gem 'annotate'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec_junit_formatter'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
