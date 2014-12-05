source 'https://rubygems.org'

gem "annotate"
gem 'devise'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.beta4'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
# Use SCSS for stylesheets

gem 'gmail'
gem 'google-api-client', '>= 0.6'
gem 'sinatra', '>= 1.3'

gem 'twitter-bootstrap-rails'
gem 'less-rails'
gem 'omniauth' ,'>= 1.0.0 '
gem 'omniauth-google-oauth2', git: 'https://github.com/zquestz/omniauth-google-oauth2.git'
gem 'omniauth-openid'
gem 'therubyracer'
gem 'chartkick'

gem "fakeweb", "~> 1.3"

group :test, :develpment do
  gem 'cucumber-rails', :require =>false #bdd
  gem 'cucumber-rails-training-wheels'# get starting with cucumver
  gem 'database_cleaner'
  gem 'capybara' #framework 
  gem "capybara-webkit"
  gem 'selenium-webdriver'
  gem 'launchy'
  gem 'sqlite3'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end
gem 'sass-rails', '~> 5.0.0.beta1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jQuery as the JavaScript library
gem 'jquery-rails', '~> 4.0.0.beta2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0.0.beta4'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg'
end

