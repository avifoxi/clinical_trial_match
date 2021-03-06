source 'https://rubygems.org'
ruby "2.1.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.9'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.4'
gem 'bootstrap-sass', '~>3.3.0'
gem 'compass-rails', '~>2.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'rubocop', require: false

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# For geocoding locations
gem 'geocoder', '1.2.0'

# For parsing Clinical Trials.gov RSS Feed
gem 'nokogiri'
gem 'rest-client'

# For user authentication
gem 'devise'
gem 'omniauth-twitter'

# Adding Pagination
gem 'will_paginate'

# For Country Dropdown
gem 'carmen'

# Tool to open zip files
gem 'rubyzip'

group :development, :test do
	gem 'dotenv-rails'


	# Use Guard + Addons for automated test runs
  gem 'guard'
 	gem 'guard-rspec'
  # gem 'terminal-notifier-guard'
  gem 'pry'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'faker'
  gem "capybara"
  gem "launchy"
  gem "selenium-webdriver"
  gem "capybara-webkit"
  gem 'database_cleaner'
  gem "codeclimate-test-reporter"
end

group :production do
	gem 'rails_12factor'
  gem 'unicorn'
end

group :development do
  gem 'jazz_hands'

  # Works for rails console
  gem 'meta_request'

  # better error pages in dev
  gem 'rails-erd'
  gem 'better_errors'
  gem 'binding_of_caller'
  # dump data into seed files for production
  gem 'seed_dump'

end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

