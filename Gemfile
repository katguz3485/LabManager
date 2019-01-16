# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.3'

gem 'aws-sdk'
gem 'bootsnap', require: false
gem 'bootstrap'
gem 'bootstrap4-kaminari-views'
gem 'bootstrap_form'
gem 'carrierwave', '~> 1.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'draper'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
gem 'figaro'
gem 'fog-aws', require: true
gem 'font-awesome-rails'
gem 'gretel'
gem 'haml-rails', '~> 1.0'
gem 'html2haml'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'momentjs-rails'
gem 'omniauth-facebook' # for Facebook Authentication
gem 'omniauth-github', '~> 1.1.2' # for Github Authentication
gem 'omniauth-google-oauth2',       '~> 0.5.1' # for Google Authentication
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1'
gem 'redis', '~> 4.0'
gem 'rubocop'
gem 'sass-rails'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier'

group :development, :test do
  gem 'byebug'
  gem 'factory_bot_rails'
  gem 'guard-livereload', '~> 2.5.2'
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'better_errors'
  gem 'guard-rubocop', require: false
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'capybara-screenshot'
  gem 'database_cleaner'
  gem 'elasticsearch-extensions'
  gem 'factory_bot'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda'
  gem 'shoulda-matchers', '~> 3.1'
end

group :production do
  gem 'rails_12factor'
end
