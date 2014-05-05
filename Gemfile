source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

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
gem "zipruby"

group :development, :test do
	gem 'dotenv-rails'

  # dump data into seed files for production
  gem 'seed_dump'

	# Use Guard + Addons for automated test runs
  gem 'guard'
 	gem 'guard-rspec'

 	# better error pages in dev
	gem 'better_errors'
	gem 'binding_of_caller'
end


group :production do
	gem 'rails_12factor'
  gem 'unicorn'
end


group :development do
  gem 'jazz_hands'

  # Works for rails console
  gem 'meta_request'

end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
