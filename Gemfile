source 'https://rubygems.org'
git_source(:github) {|repo| "https://github.com/#{repo}.git"}

ruby '2.5.1'

gem 'aws-sdk', '~> 3'
gem 'bootsnap', '>= 1.2', require: false
gem 'bootstrap-sass'
gem 'carrierwave', '~> 1.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'draper'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
gem 'figaro'
gem 'fog-aws', require: true
gem 'font-awesome-rails'
gem 'gretel'
gem 'haml-rails', '~> 1.0'
gem 'html2haml'
gem 'jbuilder', '~> 2.5'
gem 'jquery-datatables-rails'
gem 'jquery-rails'
gem 'momentjs-rails'
gem 'omniauth-facebook'      #for Facebook Authentication
gem 'omniauth-google-oauth2' #for Google Authentication
gem 'omniauth-github',              '~> 1.1.2' #for Github Authentication
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'pundit'
gem 'rails', '~> 5.2.1'
gem 'sass-rails'
gem 'sendgrid-ruby'
gem 'sidekiq'
gem 'simple_form'
gem 'tether-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier'
gem 'redis', '~> 4.0'

group :development, :test do
  gem 'byebug', platforms: %w(mri mingw x64_mingw)
  gem 'pry'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.7'
end


group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'better_errors'
  gem 'guard-rubocop', require: false
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
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

